#!/bin/bash

RED=$'\033[1;31m'
YELLOW=$'\033[1;33m'
GREEN=$'\033[1;32m'
RESET=$'\033[0m'

INFO="${YELLOW}[INFO]${RESET}"
ERROR="${RED}[ERROR]${RESET}"
SUCCESS="${GREEN}[SUCCESS]${RESET}"

DOTFILES_DIR="$(cd "$(dirname "$BASH_SOURCE[0]")" && pwd)"

for file in "$DOTFILES_DIR"/.*; do
  filename=$(basename "$file")
  dest="$HOME/$filename"

  case "$filename" in .|..|.git|.gitignore|.DS_Store) continue ;; esac

  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$file" ]; then
    echo "$INFO $dest is already symlinked to $file"

  elif [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "$ERROR $dest already exists (but is not symlinked to $file)"

  else
    if ln -s "$file" "$dest"; then
      echo "$SUCCESS Symlinked $dest -> $file"
    else
      echo "$ERROR Failed to create symlink for $dest"
    fi
  fi
done
