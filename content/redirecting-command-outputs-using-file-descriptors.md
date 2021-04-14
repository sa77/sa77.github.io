+++
title = "Redirecting CLI outputs using file descriptors"
slug = "redirecting-command-outputs-using-file-descriptors"
layout = "page.html"
date = 2016-03-10
draft = false
[taxonomies]
tags = ["cli", "terminal"]
+++

A terminal shell (bash, zsh) in Unix-like systems provide three standard file descriptors for any file in the filesystem.

- **STDIN** (Standard Input) - file descriptor 0
- **STDOUT** (Standard Output) - file descriptor 1
- **STDERR** (Standard Error) - file descriptor 2

There are other cool things you can do with file descriptors but this post is just as a quick guide to some specific use cases - which is to redirect terminal outputs.

Let's see what we can do with the default file descriptors:

1. Redirect STDOUT of a command to a file.

	```zsh
	ls 1> file_list
	```
	Even if we skip to mention file descriptor in our commands, it is defaulted to 1 (STDOUT)

	```zsh
	ls > file_list
	```

2. Redirect STDERR of a command to a file.

	```zsh
	ls 2> file
	```
3. Redirect both *STDOUT* and *STDERR* to a file.

	```zsh
	ls -ltra &>file
	# another way to do it
	ls -ltra >&file
	```
4. Redirect both STDOUT and STDERR to the same destination one after another.

	```zsh
	# STDOUT is redirected first, followed by STDERR
	ls -a >file 2>&1
	```

This can be really handy when you're working on linux/osx terminals. Cheers!
