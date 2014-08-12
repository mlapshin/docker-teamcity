FROM ubuntu:14.04

ENV TEAM_CITY_VERSION 8.1.4
ENV TEAMCITY_DATA_PATH /opt/teamcity-data

RUN apt-get update
RUN apt-get install -y wget default-jre
RUN mkdir /opt/teamcity
RUN wget -q -O - http://download-ln.jetbrains.com/teamcity/TeamCity-$TEAM_CITY_VERSION.tar.gz | tar xzf - -C /opt/teamcity
Add run.sh /run.sh

VOLUME ["/opt/teamcity-data"]
EXPOSE 8111
CMD /run