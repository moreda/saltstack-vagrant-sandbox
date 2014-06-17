#!/bin/bash

# Add remotes provided in STDIN, one per line and two columns:
# remote_name repo
awk '
!/^($|[:space:]*#)/ {
  cmd = "git remote add -f " $1 " " $2;
  print cmd;
  system(cmd);
}
'
