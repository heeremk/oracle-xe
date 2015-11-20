# oracle-xe
A [Docker](https://www.docker.com/) [image](https://registry.hub.docker.com/u/wscherphof/oracle-xe-11g-r2/) with [Oracle® Database Express Edition 11g Release 2 (11.2)](http://www.oracle.com/technetwork/database/database-technologies/express-edition/overview/index.html) running in [Oracle Linux 7.1](http://www.oracle.com/us/technologies/linux/overview/index.html)
- Default XE database on port 1521
- Web management console on port 8080

## Build own image
When building your own image from this repo, make sure to satisfy these prereqs:
- install docker 1.9.0 or higher
- make sure docker host machine has swap space of at least 2G
- download oracle installer file 'oracle-xe-11.2.0-1.0.x86_64.rpm.zip' into dir
- if behind proxy propagate proxy vars into build, e.g.

$ docker build --build-arg HTTP_PROXY=$http_proxy -t oracle-xe -f Dockerfile .

## Install
1. [Install Docker](https://docs.docker.com/installation/#installation)
1. `$ docker pull heeremk/oracle-xe`


## Run
Create and run a container named db:
```
$ docker run -d -p 1521:1521 --name db heeremk/oracle-xe
989f1b41b1f00c53576ab85e773b60f2458a75c108c12d4ac3d70be4e801b563
```

## Connect
The default password for both the `sys` and the `system` user is `manager`
```
So from the docker host, you can connect with `system/manager@localhost:1521`
```
When connecting from another machine, first lookup ip of your docker host and use that.

$ boot2docker ip
The VM's Host only interface IP address is: 192.168.0.203

```
If you're looking for a database client, consider [sqlplus](http://www.oracle.com/technetwork/database/features/instant-client/index-100365.html)
```
$ sqlplus system/manager@192.168.0.203:1521

SQL*Plus: Release 11.2.0.4.0 Production on Mon Sep 8 11:26:24 2014

Copyright (c) 1982, 2013, Oracle.  All rights reserved.


Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> |
```
