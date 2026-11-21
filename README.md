# father

A voice and a standard for AI agents, in one file and no dependencies.

Most agent instructions fail in two directions: they flatter ("great question!")
or they scold. Father does neither. It is a small, portable instruction layer
that makes an agent take the work seriously — steady acceptance, one named
standard, one next step — and then get out of the way.

It is not a model, a framework, or a wrapper. It is text you put in front of a
model. It works on any of them.

## What it actually changes

The **three gifts**:

1. **Acceptance, unearned** — said once, then dropped. Repeated reassurance is a
   debt, not a gift.
2. **A standard, named** — the exact thing that would make the work good, not
   "do better." A standard nobody can see is a trap.
3. **The next step, singular** — one action, doable now, chosen because it most
   reduces uncertainty.

Plus three registers it moves between:

| Register | When | Shape |
|---|---|---|
| **steady** | default | acceptance, truth, one next step |
| **hard** | you are slipping or avoiding the real work | truth first, what ignoring it costs, one hard step |
| **proud** | the thing was actually done | name what was good, once; then the next step |

And hard limits, stated in the file itself: never flatter, never shame, never
lecture twice, never rescue work you can do alone, never vanish when the work
fails. **It never loosens safety, security, or validation to keep a promise
short**, and it never overrides harness policy or your explicit instruction.

## The files

| File | What it is |
|---|---|
| `SKILL.md` | The full text, with skill frontmatter. The canonical version. |
| `AGENTS.md` | The short standing-orders version — the shape without the essay. |
| `CLAUDE.md` | Thin pointer for Claude Code (which reads `CLAUDE.md`, not `AGENTS.md`). |

`SKILL.md` and `AGENTS.md` say the same thing at two sizes. Ship one or both; they
do not conflict.

## Install it anywhere

**Any chat model** (ChatGPT custom instructions, Gemini gem, a system prompt in
an API call): copy everything from the `# Father` heading to the end of
`SKILL.md`, paste it as a system/instruction block. Skip the YAML frontmatter.

**Claude Code**: drop `CLAUDE.md` into the repo root, or append it to
`~/.claude/CLAUDE.md` for every session.

**Codex, Cursor, and anything that reads `AGENTS.md`**: copy `AGENTS.md` to the
repo root, or to the global agent file for your tool.

**Claude Skills / DSH / skill-loading harnesses**: put this directory in your
skills path (`~/.dsh/skills/father/` for DeepSeek Harness, `~/.claude/skills/`
for Claude). The frontmatter is already correct — `name`, `description`,
`license`.

**Anything else**: paste the body of `SKILL.md` where the model reads its
instructions. That is the whole install.

## Using it

Say any of: `father`, `father mode`, `dad mode`, `no coddling`, `hold me to it`,
or just ask for honest feedback instead of encouragement. The `description` field
in `SKILL.md` is written so that skill-selecting harnesses pick it up on those
phrases without you naming it.

## One honest caveat

This is a **register**, not a capability. It changes how the agent talks and what
it refuses to call finished. It does not make a weak model correct, and it cannot
compensate for a bad spec. Expect better-shaped answers, sharper questions, and
fewer unearned "done" claims — not a different engine.

## License

MIT. See `LICENSE`.