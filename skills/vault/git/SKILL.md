# Skill: `git`

**Description:** Assists users in executing Git version control operations, ranging from basic daily workflows to advanced history manipulation and crisis recovery. 
**Trigger:** Activate this skill when the user needs to initialize a repository, commit code, branch, merge, resolve version control errors, undo changes, or rewrite Git history.

---

## 🧠 Core Knowledge Base

### 1. The Daily Loop (Basic Operations)
Use this workflow for standard, day-to-day coding tasks.
*   **Check state:** `git status`
*   **Stage changes:** `git add .` (or specific files)
*   **Commit changes:** `git commit -m "descriptive message"`
*   **Sync local to cloud:** `git push`
*   **Sync cloud to local:** `git pull`

### 2. Branching & Isolation
Use this for developing features without affecting the main codebase.
*   **Create & switch:** `git switch -c <branch-name>`
*   **Switch back:** `git switch main`
*   **Merge back:** `git merge <branch-name>`

### 3. Local Mistake Recovery (Unpushed Changes)
Use this when the user makes a mistake locally but hasn't pushed to a remote yet.
*   **Hide uncommitted work:** `git stash` / `git stash pop`
*   **Discard local file changes:** `git restore <filename>`
*   **Undo last commit (keep changes staged):** `git reset --soft HEAD~1`

### 4. Public Mistake Recovery (Pushed Changes)
Use this when bad code has already been pushed to a shared remote repository.
*   **Safely undo a commit:** `git revert <commit-hash>` (Creates a new commit that undoes the target commit).

### 5. History Rewriting & Debugging (Advanced)
Use these commands to clean up history or track down bugs.
*   **Squash commits:** `git rebase -i HEAD~<number>`
*   **Update branch with main:** `git rebase main`
*   **Copy a specific commit:** `git cherry-pick <commit-hash>`
*   **Find a bug's origin:** `git bisect start`, `git bisect bad`, `git bisect good <hash>`
*   **Find context for a line:** `git blame <filename>`

---

## 🚨 Gotchas & Continuous Improvement Rules

*This section ensures the skill operates safely and learns from common Git pitfalls.*

1.  **The Golden Rule of Rebasing:** NEVER run `git rebase` on branches that multiple people are working on (like `main` or `develop`). It rewrites history and will break teammates' local repositories. Only rebase local feature branches.
2.  **Reset vs. Revert Confusion:** If the commit is local (unpushed), `reset` is fine. If the commit is pushed to a remote, ALWAYS use `revert`. `reset` on a pushed branch requires a `force push` and erases history for others.
3.  **The `checkout` vs. `switch/restore` modernization:** Older tutorials use `git checkout` for everything (creating branches, discarding changes). Use the modern, safer commands instead: `git switch` for branches and `git restore` for files.
4.  **Panic Protocol (The Reflog):** If a user accidentally deletes a branch or messes up a rebase, DO NOT panic. Git keeps a hidden history. Always run `git reflog` to find the hash of the state before the mistake, and `git reset --hard <hash>` to restore it.
5.  **Stash Pop Conflicts:** `git stash pop` can cause merge conflicts if the stashed code conflicts with new changes. Advise users to ensure their working directory is clean before popping, or resolve conflicts immediately after popping.
6.  **Commit Message Hygiene:** Always enforce clear, imperative commit messages (e.g., "Add login button" instead of "Added login button" or "fixed it").

---

## 🔄 Execution Workflow (How to apply this skill)

1.  **Diagnose State:** Always ask the user to run `git status` and `git log --oneline` first if they are in trouble. You cannot fix a Git issue without knowing the current state.
2.  **Identify Push Status:** Ask the user, "Have you pushed this to the remote repository (GitHub/GitLab) yet?" This determines whether you use `reset` (local) or `revert` (public).
3.  **Execute Safely:** Provide the exact command. If the command is destructive (`reset --hard`, `rebase`), warn the user before they execute it.
4.  **Verify:** Provide the command to verify the fix (e.g., `git status` or `git log --oneline` to ensure the history looks correct).