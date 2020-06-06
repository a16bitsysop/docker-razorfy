#!/bin/sh
#display environment variables passed with --env
echo '$RAZORFY_DEBUG=' $RAZORFY_DEBUG
echo '$RAZORFY_BINDPORT=' $RAZORFY_BINDPORT
echo '$RAZORFY_MAXTHREADS=' $RAZORFY_MAXTHREADS
echo '$TIMEZONE=' $TIMEZONE
echo

NME=razor

if [ -n "$TIMEZONE" ]
then
  echo "Waiting for DNS"
  ping -c1 -W60 google.com || ping -c1 -W60 www.google.com || ping -c1 -W60 google-public-dns-b.google.com
  apk add --no-cache tzdata
  if [ -f /usr/share/zoneinfo/"$TIMEZONE" ]
  then
    echo "Setting timezone to $TIMEZONE"
    cp /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime
    echo "$TIMEZONE" > /etc/timezone
  else
    echo "$TIMEZONE does not exist"
  fi
  apk del tzdata
fi

echo "export RAZORFY_BINDADDRESS=0.0.0.0" > /home/"$NME"/.profile
[ -n "$RAZORFY_DEBUG" ] && echo "export RAZORFY_DEBUG=$RAZORFY_DEBUG" >> /home/"$NME"/.profile
[ -n "$RAZORFY_BINDPORT" ] &&  echo "export RAZORFY_BINDPORT=$RAZORFY_BINDPORT" >> /home/"$NME"/.profile
[ -n "$RAZORFY_MAXTHREADS" ] &&  echo "export RAZORFY_MAXTHREADS=$RAZORFY_MAXTHREADS" >> /home/"$NME"/.profile

echo "Starting razorfy at $(date +'%x %X')"
echo "Changing to user $NME"
su -c '/usr/local/bin/razorfy.pl' - "$NME"
