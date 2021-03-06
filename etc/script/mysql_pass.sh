clear
echo "|-----------------------------------------|"
echo "|------|  MySQL Database config |---------|"
echo "|-----------------------------------------|"
echo ""
sleep 2

read -p "Enter your mysql password : " SQL_PASS
. /usr/local/bin/hotspot/mysar/etc/config.ini
if [ -z $SQL_PASS ]; then
	read -p "Change MySql root password: " SQL_PASS
fi

if [ -z $SQL_PASS ]; then
	echo "Abort."
	echo "Password is not change..."
	echo ""
else
	sed -i "s/$dbPass/$SQL_PASS/g" /opt/hotspot/admin/system/air/config/database.php
	sed -i "s/$dbPass/$SQL_PASS/g" /opt/hotspot/admin/true/db.php
	sed -i "s/$dbPass/$SQL_PASS/g" /usr/local/bin/hotspot/include/config.inc.php
	sed -i "s/$dbPass/$SQL_PASS/g" /usr/local/bin/hotspot/mysar/etc/config.ini
	sed -i "s/$dbPass/$SQL_PASS/g" /usr/local/bin/hotspot/psql.pl
	sed -i "s/$dbPass/$SQL_PASS/g" /etc/freeradius/sql.conf
	sed -i "s/$dbPass/$SQL_PASS/g" /etc/script/changeaccess.sh
#	sed -i "s/$dbPass/$SQL_PASS/g" /var/www/kickuser/include/config.inc.php
	echo "Password save..."
	echo ""
	sleep 3
fi
