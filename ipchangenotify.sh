#/bin/sh
IPADDRESS=`curl -s echoip.com`
STOREIPFILE=./.current_ip
EMAIL=""

if [ $EMAIL != "" ]
then
	CURRENTIP=$(cat $STOREIPFILE)

	if [ "${IPADDRESS}" != "${CURRENTIP}" ]
	then
		echo "Your new IP address is ${IPADDRESS}" |
		mail -s "IP address change" $EMAIL
		echo ${IPADDRESS} >|$STOREIPFILE
	fi
else
	echo "Configure this script!"
	exit 1
fi
