#!/bin/bash

# Fetch remotes provided in STDIN, one per line and two columns:
# remote_name repo
awk '
!/^($|[:space:]*#)/ {
  cmd = "git fetch -v " $1;
  print cmd;
  system(cmd);
}
'
