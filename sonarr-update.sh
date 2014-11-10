#!/bin/bash

# 52 /tmp/nzbdrone_update /opt/NzbDrone/NzbDrone.exe

sv stop sonarr

rm -Rf /opt/NzbDrone/*
mv $2/NzbDrone/* /opt/NzbDrone/

sv start sonarr
