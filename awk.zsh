# print lines that match a criteria
git status --short | awk '$1 == "AA"' {print $0}
