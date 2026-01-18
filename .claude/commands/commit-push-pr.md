---
name: commit-push-pr
purpose: コミット、プッシュ、PR作成
triggers: ["/commit-push-pr"]
depends-on: ["/review-spec"]
outputs: ["git commit", "git push", "PR URL"]
---

# Commit, Push, and Create PR

Commit all staged changes, push to remote, and create a pull request.

## TL;DR

1. 変更確認 → ステージング
2. コミット → 英語、論理単位で分割
3. プッシュ → upstream設定
4. PR作成（feature branch時）→ URL返却

## Context

Current git status:

```bash
$(git status --short)
```

Current branch:

```bash
$(git branch --show-current)
```

Default branch:

```bash
$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
```

Staged diff:

```bash
$(git diff --cached --stat)
```

Recent commits on this branch:

```bash
$(git log --oneline -5)
```

## Instructions

1. Review the staged changes above
2. If there are no staged changes, stage the appropriate files
3. Group changes by logical unit (feature, fix, refactor, etc.) and create separate commits for each
4. Write commit messages in English, using simple one-liner format (e.g., `Add validation for project name`)
5. Push to the remote branch (create upstream if needed)
6. **If on default branch (main/master)**: Commit and push directly - no PR needed
7. **If on feature branch**: Create a PR to the default branch using `gh pr create` and return the PR URL
8. **IMPORTANT**: Never create a new branch without user permission

## Troubleshooting

| 問題 | 原因 | 対処 |
|------|------|------|
| push拒否 | リモートに新しいコミット | `git pull --rebase` 後に再push |
| PR作成失敗 | gh未認証 | `gh auth login` で認証 |
| コンフリクト | ブランチ分岐後の変更 | `git rebase main` で解消 |
