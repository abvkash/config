#!/bin/bash

RED=$'\033[1;31m'
YELLOW=$'\033[1;33m'
GREEN=$'\033[1;32m'
RESET=$'\033[0m'

INFO="${YELLOW}[INFO]${RESET}"
ERROR="${RED}[ERROR]${RESET}"
SUCCESS="${GREEN}[SUCCESS]${RESET}"

cd "$(dirname "$BASH_SOURCE[0]")" || exit 1

if ! command -v brew >/dev/null 2>&1; then
  echo "$INFO Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ -f "./Brewfile" ]; then
  brew bundle --file="./Brewfile"
  echo "$SUCCESS Finished"
else
  echo "$ERROR Brewfile does not exist"
fi
