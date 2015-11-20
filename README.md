# oracle-xe
A [Docker](https://www.docker.com/) [image](https://registry.hub.docker.com/u/wscherphof/oracle-xe-11g-r2/) with [Oracle® Database Express Edition 11g Release 2 (11.2)](http://www.oracle.com/technetwork/database/database-technologies/express-edition/overview/index.html) running in [Oracle Linux 7.1](http://www.oracle.com/us/technologies/linux/overview/index.html)
- Default XE database on port 1521
- Web management console on port 8080

Make sure your host machine has a swap space of at least 2G

Run your oracle-xe container using 

docker run -p:8080:8080 -p:1521:1521 --name=myoracle -d heeremk/oracle-xe


