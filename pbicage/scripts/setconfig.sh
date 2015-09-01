#!/bin/sh
# Script which will set values for bitlbee
#
# Called by AppCafe with:
# $1 = Key which needs updating
# $2 = Value we have set Key to
# $3 = {YES|NO} - YES if this is the last value the user changed
#      (Used to optionally restart services, etc)

KEY="$1"
VALUE="$2"
ATEND="$3"
CFGFILE="/etc/elephantdrive/elephantdrive.config"
touch $CFGFILE

# If no old line found, lets add it
if [ "$KEY" = "Username" ] ; then
  cat $CFGFILE | grep -v "username " > ${CFGFILE}.new
  echo "username $VALUE" > ${CFGFILE}
  cat ${CFGFILE}.new >> ${CFGFILE}
  rm ${CFGFILE}.new  
elif [ "$KEY" = "Password" ] ; then
  cat $CFGFILE | grep -v "userpassword " > ${CFGFILE}.new
  mv ${CFGFILE}.new ${CFGFILE}
  echo "userpassword $VALUE" >> ${CFGFILE}
fi

# If we are done changing values
if [ "$ATEND" = "YES" ] ; then
  # Restart elephantdrive
  service elephantdrive restart
fi
