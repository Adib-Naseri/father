# father

A portable instruction kit for AI agents: one standing-orders file and seven
skills, verbatim from a working install. No dependencies, no framework, no
model. Text you put in front of a model, and it behaves better.

Built for **father** — a voice and a standard: steady acceptance, one named
standard, one next step, no flattery, no shame, no vanishing when the work
fails. Carries **ponytail** alongside it: the lazy senior dev that ships the
smallest change that fully works. Father governs the voice; ponytail governs the
size. They do not argue.

## Contents

| Path | What it is |
|---|---|
| `AGENTS.md` | Standing orders. Short enough to load every turn. |
| `skills/father/SKILL.md` | The full father text: three gifts, registers, hard limits. |
| `skills/ponytail/SKILL.md` | Lazy senior dev mode, levels lite/full/ultra. |
| `skills/ponytail-audit/` | Whole-repo quality audit, ranked. |
| `skills/ponytail-review/` | Review one change: logic, safety, load, tests, speed. |
| `skills/ponytail-debt/` | Ledger of every deferred shortcut. |
| `skills/ponytail-gain/` | Measured savings from the benchmark. |
| `skills/ponytail-help/` | Quick reference for levels and commands. |
| `install.sh` | Symlinks (or copies) everything into a harness. |
| `NOTICE` | Provenance and licensing for third-party files. |

## Install

```bash
git clone git@github.com:Adib-Naseri/father.git
cd father
./install.sh ~/.dsh/skills        # DeepSeek Harness
./install.sh ~/.claude/skills     # Claude Code
./install.sh --copy ~/.codex/skills
```

`AGENTS.md` is placed in the parent of the target directory. Use `--no-agents` to
skip it, `--force` to replace what is already there.

Symlinking is the default on purpose: **one source of truth**. Edit the clone,
every harness sees the change, and `diff` is the proof. Copy mode is for tools
that refuse symlinks — accept then that you own the drift.

### Harnesses that read AGENTS.md

Codex, Cursor, and anything AGENTS-aware: copy `AGENTS.md` to the project root,
or to the tool's global agent file. That single file is the whole register; the
skills are the deep version.

### Claude Code

`CLAUDE.md` in this repo is a pointer. Drop it in a project root, or append it to
`~/.claude/CLAUDE.md` for every session.

### Plain chat models

Copy `skills/father/SKILL.md` from the `# Father` heading down — skip the YAML
frontmatter — and paste it into custom instructions or a system prompt. That is
the entire install for ChatGPT, Gemini, or a raw API call.

## Verify it landed

Zero output means the installed copy is identical to this repo:

```bash
for f in skills/*/SKILL.md; do
  diff "$f" ~/.dsh/skills/$(basename "$(dirname "$f")")/SKILL.md
done
```

## What this will not do

This is a **register, not a capability**. It changes how an agent talks and what
it refuses to call finished. It does not make a weak model correct, and it
cannot fix a bad spec. Expect sharper questions, fewer unearned "done" claims,
and replies shaped like the work instead of like encouragement. Nothing more.

## Security

`skills/father/.perch/` was deliberately excluded: it holds a Perch project
manual and an `mcp.json` containing a **plaintext third-party API key** plus a
machine-local absolute path. Secrets and machine paths do not belong in a public
repo. If you fork the source install, check that directory before publishing and
rotate anything that leaked.

## License

MIT — see `LICENSE`. Six ponytail skills are vendored MIT from
[DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) v5.3.3;
see `NOTICE` for provenance and copyright.