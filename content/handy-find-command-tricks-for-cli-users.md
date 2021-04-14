+++
title = "Handy find command tricks for CLI users"
slug = "handy-find-command-tricks-for-nix-terminal-users"
layout = "page.html"
date = 2018-12-01
draft = false
[taxonomies]
tags = ["cli", "terminal"]
+++

`find` command is one of those commands which is available in almost every terminal shell of a linux/UNIX based operating system.

It is a very handy tool that just saves a lot of time if you spend a lot of time on terminal consoles.

Here's a quick cheatsheet sort of list for using this amazing
utility for finding files by file-name, file-timestamp, file-size and file-permission.

## Find by filename
```zsh
# wildcards into the wild
find -name "*.txt"
find -type f -name "*.txt"
find -name "2018*5*11_*"
find -name "2018.*5.*11_*"
```

```zsh
# regular expressions VS wildcards
find -name '*.c' -o -name '*.h'
find -name '*.[c|h]'
```

```zsh
# case insensitive lookup
find -iname '*.Txt'
```

```zsh
# exclude filenames lookup
find ./ -not -name '*.c'
find ./ ! -name '*.c'
```

## Find by file timestamp

```zsh
# find all files that are 'accesed' 2 days ago
find -atime 2
# find all files that are 'accesed' between 2-10 days ago
find -atime +2 -atime -10
# find all files that are 'accesed' in last 1 hour
find ./ -amin 60
```

```zsh
# find all files that are 'modified' 2 days ago
find ./ -mtime 2
# find all files that are 'modified' between 2-10 days ago
find ./ -mtime +2 -mtime -10
# find all files that are 'modified' in last 1 hour
find ./ -mmin 60
```

## Find by file size
```zsh
# find all files with size more than 3MB
find ./ -size +3M
# find all files with size between 3MB - 10MB
find ./ -size +3M -size -10M
```

## Find by file permission
```zsh
# find files recursively in $CWD having file permission: 0700
find ./ -type f -perm 0700
```