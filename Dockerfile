FROM oraclelinux:7.1
MAINTAINER Mark Heeren <mmmheeren@gmail.com>

# Install prerequisites
ENV http_proxy $HTTP_PROXY
RUN yum install -y make libaio bc net-tools vte3 unzip

# Install oracle
# Make sure docker host has >2G swap available
ADD oracle-xe-11.2.0-1.0.x86_64.rpm.zip /tmp
RUN unzip /tmp/oracle-xe-11.2.0-1.0.x86_64.rpm.zip
RUN yum localinstall -y Disk1/oracle-xe-11.2.0-1.0.x86_64.rpm; rm -f /tmp/oracle-xe-11.2.0-1.0.x86_64.rpm.zip

ENV ORACLE_SID  XE
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV PATH        $ORACLE_HOME/bin:$PATH

# Configure database
ADD init.ora initXETemp.ora xe.rsp /u01/app/oracle/product/11.2.0/xe/config/scripts/
RUN service oracle-xe configure responseFile=/u01/app/oracle/product/11.2.0/xe/config/scripts/xe.rsp

# Start database
ADD start.sh /
CMD /start.sh

EXPOSE 1521
EXPOSE 8080
