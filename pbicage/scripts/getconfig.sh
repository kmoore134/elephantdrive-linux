#!/bin/sh
# Script which will set values for ElephantDrive
#
# Called by AppCafe with:
# $1 = Key we are looking for value to

KEY="$1"
CFGFILE="/etc/elephantdrive/elephantdrive.config"

touch $CFGFILE

# Get value from config file
if [ "$KEY" = "Username" ] ; then
  oldvalue=`grep "^username " $CFGFILE 2>/dev/null | head -n 1 | sed "s|^username ||g"`
elif [ "$KEY" = "Password" ] ; then
  oldvalue=`grep "^userpassword = " $CFGFILE 2>/dev/null | head -n 1 | sed "s|^userpassword ||g"`
fi

if [ -n "$oldvalue" ] ; then
  echo "$oldvalue"
fi
