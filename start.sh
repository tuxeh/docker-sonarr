#!/bin/bash

function handle_signal {
  echo "received signal"
  kill `cat /tmp/sonarr.lock`
  rm -fv /tmp/sonarr.lock
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

echo "starting sonarr"

rm -fv /tmp/sonarr.lock
mono-service -l:/tmp/sonarr.lock --no-daemon /opt/NzbDrone/NzbDrone.exe --no-browser -data=/volumes/config/sonarr & wait

echo "stopping sonarr"
