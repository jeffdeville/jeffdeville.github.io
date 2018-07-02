---
title: Logging to the console and a file from Bash
tags: code bash
---
## Goals

We’re going to provide a drop in script component that will allow you to log output (stdout and stderr) to a file, as well as the screen. In a follow-up, we’ll show how this can also be run through a filter so that your output could be timestamped. We’ll also put in some simple error handling to ensure the logging destination exists.

Script with log

## Code

Place this at the top of your script

```
exec &> >( tee "$LOGFILE" )
```

## Usage

```
$LOGFILE=output.log ./script.sh
```

## How it works

This is a pretty dense line. Here are the concepts:

```
exec &>
```

Redirects the stderr & stdout of the entire script. [man exec](http://www.tldp.org/LDP/abs/html/x17974.html) `&>` is shorthand for redirecting both stderr and stdout.

```
>( ... )
```

The process (the command in parenthesis) receives its input from exec (stdin & stderr) Read more on [Process Substitution](https://www.gnu.org/software/bash/manual/bashref.html#Process-Substitution)

```
tee
```

Tee is one of those rare bash commands with a name that actually makes sense. It reads from standard input, and writes it to standard output and files. It basically takes input from 1 place, and can write it to multiple output destination. man tee

```
"${LOGFILE}"
```

[Shell Parameter Expansion](https://www.gnu.org/software/bash/manual/bashref.html#Shell-Parameter-Expansion) Shell parameter expansion doesn’t have to use {}, and in this case it shouldn’t matter, but it’s a best practice.  The quotes will make sure that file names with a space won’t break the logging

I’d like to call out [Michael Hormer’s answer](https://unix.stackexchange.com/questions/145651/using-exec-and-tee-to-redirect-logs-to-stdout-and-a-log-file-in-the-same-time/145654#145654) as being especially instructive as I was sorting this out.
