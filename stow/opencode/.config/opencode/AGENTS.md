# Global agent rules

## Never make commits

- Never create Git commits. Leave all work uncommitted for the user to review and commit themselves.
- Requests to save or "commit" discussion progress mean persisting it in files, not creating a Git commit.
- Do not run `git commit`, `git merge`, `git rebase`, or `git cherry-pick`.

This is backed by a hard `permission.bash` deny rule in `opencode.jsonc`, so attempts will be blocked regardless.
