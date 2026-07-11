#!/usr/bin/env bash
set -euo pipefail

# recursively symlinks every file in this repo under a "." entry (except for
# .git and .gitignore). Directories are created for real in DEST
REPO="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:-$HOME}"

cd "$REPO"

dotfiles=()
for d in .*; do
    case "$d" in .|..|.git|.gitignore) continue ;; esac
    dotfiles+=("$d")
done

find "${dotfiles[@]}" -type f -o -type l | while read -r f; do
    if [ -e "$DEST/$f" ] && [ ! -L "$DEST/$f" ]; then
        echo "skipping $f: $DEST/$f exists and is not a symlink"
    else
        mkdir -p "$DEST/$(dirname "$f")"
        ln -sfn "$REPO/$f" "$DEST/$f"
        echo "linked $DEST/$f -> $REPO/$f"
    fi
done
