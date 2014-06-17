In this directory you should create a salt top.sls.
Example of contents for that file:

``yaml
base:
  '*':
    - system.packages
    - system.swap
```
