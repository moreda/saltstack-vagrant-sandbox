#!/bin/bash

# Merge subtrees provided in STDIN, one per line and two columns:
# remote_name prefix branch
awk '
!/^($|[:space:]*#)/ {
  cmd = "git subtree merge -P " $2 " " $1 "/" $3 " --squash";
  print cmd;
  system(cmd);
}
'
