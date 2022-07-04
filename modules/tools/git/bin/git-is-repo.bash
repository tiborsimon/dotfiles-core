#!/usr/bin/env bash
set -e

if [ -d .git ]; then
  exit 0
else
  git rev-parse --git-dir &>/dev/null;
fi
