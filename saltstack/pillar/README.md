In this directory you should create a pillar top.sls.

Example of contents for that file:

```yaml
base:
  '*':
    - users
    - sudo
    - system
    - zabbix
    - apache
    - php5
    - rsyslog
```

You have to be sure that the sls files do actually exist.
