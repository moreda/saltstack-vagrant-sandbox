#!/bin/bash

# Add subtrees provided in STDIN, one per line and two columns:
# prefix remote_name branch
awk '
!/^($|[:space:]*#)/ {
  cmd = "git subtree add -P " $1 " " $2 " " $3 " --squash";
  print cmd;
  system(cmd);
}
'
