#!/bin/bash
if [ -n "$DB_HOST" ]; then
	CONFIG_PATH = $TEAMCITY_DATA_PATH/config/database.properties
	touch $CONFIG_PATH

	echo "connectionUrl=jdbc:postgresql://$DB_HOST/$DB_NAME" > $CONFIG_PATH
	echo "connectionProperties.user=$DB_USER" >> $CONFIG_PATH
	echo "connectionProperties.password=$DB_PASSWORD" >> $CONFIG_PATH
fi

wget -q http://jdbc.postgresql.org/download/postgresql-9.3-1102.jdbc41.jar -P $TEAMCITY_DATA_PATH/lib/jdbc
/opt/teamcity/TeamCity/bin/teamcity-server.sh run
