#!/usr/bin/env python3
# Read and print lines from urls/fr.txt

from pathlib import Path

path = Path("fr.txt")
if not path.exists():
    raise SystemExit(f"File not found: {path}")

with path.open("r", encoding="utf-8") as f:
    for line in f:
        print(line.rstrip("\n"))