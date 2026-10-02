# Lab 03 – GenAI Usage

## GenAI used
Claude (Anthropic), via the Claude mobile app.

## Prompts used
- How to clone my GitHub repo to my machine / in the SSH-in-browser terminal
- Why `cd` and `mv` failed on my folder `-EPA--2026-2027` (name starts with a dash)
- How to rename a directory and move a file into a folder
- How to delete everything after line 30 in a script
- The code for Exercise 1 (a–e), then Exercises 2 and 3, compiled into a PDF
- Explanations of the `sed` command and the bash parameters used in the scripts
- Whether `git add .` stages all changes
- Which clone URL to use (SSH vs HTTPS)
- Why `git push` rejected my password

## Fixes and changes from AI suggestions
- Learned a leading dash makes bash treat a name as an option; fixed with `./` or `--`
- `>` and `>>` are redirection, not part of `mv`, which is why my move failed
- Git needs a personal access token, not my account password, for HTTPS pushes
- I accidentally cloned the repo inside itself (embedded repo / `mode 160000`);
  removed it with `git rm --cached` before pushing
- Used `sed -i '31,$d'` for Exercise 1b

## What I learned about the commands used
- `sed -i '31,$d' file`: `sed` is a stream editor. `-i` edits the file in place,
  `31,$` is the range from line 31 to the last line (`$`), and `d` deletes it
- `$1`, `$2`: the first and second arguments typed after the script name,
  e.g. in `./lab03_exercise3.sh 15 file`, `$1` is `15` and `$2` is `file`
- `$#`: the number of arguments passed; used so the script fails cleanly
  if one is missing
- `$0`: the script's own name, used in the usage message
- `[[ "$1" =~ ^[0-9]+$ ]]`: a regex check that `$1` contains only digits
- `-gt`: "greater than" for comparing numbers in bash


