#!/bin/sh
#
# Called by AppCafe after changing config values

# Restart elephantdrive
echo "true" > /etc/elephantdrive/elephantdrive.register

service elephantdrive restart
