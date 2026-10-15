import { execFile } from "node:child_process";
import { promisify } from "node:util";
import { Plugin } from "@opencode/plugin";

// RTK OpenCode plugin — rewrites shell commands to use rtk for token savings.
// Requires: rtk >= 0.23.0 in PATH.
//
// This is a thin delegating plugin: all rewrite logic lives in `rtk rewrite`,
// which is the single source of truth (src/discover/registry.rs).
// To add or change rewrite rules, edit the Rust registry — not this file.
//
// OpenCode v2 plugin contract: default-export `Plugin.define({ id, setup })`.
// `setup` registers hooks on the context and may return a cleanup function.
// v2 renamed the shell tools internally (bash/shell -> "execute"), so we hook
// the shell domain rather than filtering on tool names.

const execFileAsync = promisify(execFile);

export default Plugin.define({
  id: "rtk",
  async setup(ctx) {
    try {
      await execFileAsync("which", ["rtk"]);
    } catch {
      console.warn("[rtk] rtk binary not found in PATH — plugin disabled");
      return;
    }

    await ctx.shell.hook("create.before", async (event) => {
      const command = event.command;
      if (typeof command !== "string" || !command) return;

      try {
        // `rtk rewrite` exits 3 when it produces a rewrite (1 = no rule), so
        // execFile rejects on the success path. Read stdout off the rejection.
        const { stdout } = await execFileAsync("rtk", ["rewrite", command]).catch(
          (err: unknown) => ({ stdout: (err as { stdout?: string })?.stdout ?? "" }),
        );
        const rewritten = String(stdout).trim();
        if (rewritten && rewritten !== command) {
          event.command = rewritten;
        }
      } catch {
        // rtk rewrite failed — pass through unchanged
      }
    });
  },
});
