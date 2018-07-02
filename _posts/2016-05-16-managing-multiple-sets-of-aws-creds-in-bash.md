---
title: Managing multiple AWS profiles in bash
tags: code bash
---
**Updated: July 2018**

autoenv has been replaced by [direnv](https://direnv.net/)  So now you'll use .envrc files, instead of .env files. Further, the .envrc files are really just bash scripts that will execute. This means `export FOO=foo`, not just `FOO=foo`.

Direnv has installation instructions at the link above.

For multiple AWS profiles then, you just need to:

* AWS’s cli already supports the concept of profiles. Configure as desired
* add `export AWS_DEFAULT_PROFILE=<project-specific-profile>` to your .envrc file and it will be set whenever you `cd` into the directory.

