FROM ubuntu:14.04

ENV TEAM_CITY_VERSION 8.1.5
ENV TEAMCITY_DATA_PATH /opt/teamcity-data
ENV JDBC_NAME postgresql-9.3-1102.jdbc41.jar

RUN apt-get update
RUN apt-get install -y --no-install-recommends wget default-jre
RUN apt-get install -yf tzdata tzdata-java

RUN mkdir /opt/teamcity
RUN wget -q -O - http://download-ln.jetbrains.com/teamcity/TeamCity-$TEAM_CITY_VERSION.tar.gz | tar xzf - -C /opt/teamcity
RUN wget -q http://jdbc.postgresql.org/download/$JDBC_NAME -P /tmp

ADD run.sh /run.sh
RUN chmod +x /run.sh

VOLUME ["/opt/teamcity-data"]
EXPOSE 8111
CMD /run.sh
