#!/bin/bash

# Push subtrees provided in STDIN, one per line and two columns:
# prefix remote_name branch
awk '
!/^($|[:space:]*#)/ {
  cmd = "git subtree push -P " $2 " " $1 " " $3;
  print cmd;
  system(cmd);
}
'
