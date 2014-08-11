FROM ubuntu

ENV TEAM_CITY_VERSION 8.1.4
ENV TEAMCITY_DATA_PATH /opt/

RUN apt-get update
RUN apt-get install -y wget default-jre
RUN mkdir /opt/teamcity
RUN wget -q -O - http://download-ln.jetbrains.com/teamcity/TeamCity-$TEAM_CITY_VERSION.tar.gz | tar -C /opt/teamcity xzf -

EXPOSE 8111
CMD /opt/teamcity/TeamCity/bin/teamcity-server.sh run