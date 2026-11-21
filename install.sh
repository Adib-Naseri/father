#!/usr/bin/env bash
# Install this kit into a harness.
#
#   ./install.sh [--copy] [--force] [--no-agents] <skills-dir>
#
#   <skills-dir>   where the harness looks for skills, e.g.
#                    ~/.dsh/skills        DeepSeek Harness
#                    ~/.claude/skills     Claude Code
#   --copy         copy instead of symlink (for tools that dislike symlinks)
#   --force        overwrite a real file/dir that already exists there
#   --no-agents    do not touch AGENTS.md (place it yourself)
#
# AGENTS.md is written to the parent of <skills-dir>. Symlinks mean one source
# of truth: edit the clone, every harness sees it, and `diff` proves it.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COPY=0 FORCE=0 AGENTS=1
TARGET=""
for a in "$@"; do
  case "$a" in
    --copy)   COPY=1 ;;
    --force)  FORCE=1 ;;
    --no-agents) AGENTS=0 ;;
    -h|--help) sed -n '2,16p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*) echo "unknown flag: $a" >&2; exit 2 ;;
    *)  TARGET="$a" ;;
  esac
done
[ -n "$TARGET" ] || { echo "usage: ./install.sh [--copy] [--force] [--no-agents] <skills-dir>" >&2; exit 2; }

mkdir -p "$TARGET"
TARGET="$(cd "$TARGET" && pwd)"

put() { # src dst
  local src="$1" dst="$2"
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    if [ "$FORCE" = 1 ]; then rm -rf "$dst"
    else echo "exists, not overwriting (use --force): $dst" >&2; return 1; fi
  fi
  if [ "$COPY" = 1 ]; then cp -R "$src" "$dst"; else ln -s "$src" "$dst"; fi
  printf '  %-6s %s\n' "$([ "$COPY" = 1 ] && echo copied || echo linked)" "$dst"
}

echo "installing into $TARGET"
for dir in "$ROOT"/skills/*/; do
  [ -d "$dir" ] || continue
  name="$(basename "$dir")"
  put "${dir%/}" "$TARGET/$name"
done

if [ "$AGENTS" = 1 ]; then
  put "$ROOT/AGENTS.md" "$(dirname "$TARGET")/AGENTS.md"
fi

echo
echo "verify (zero output means identical):"
echo "  for f in \"\$ROOT\"/skills/*/SKILL.md; do diff \"\$f\" \"$TARGET/\$(basename \"\$(dirname \"\$f\")\")/SKILL.md\"; done"