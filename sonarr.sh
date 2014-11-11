#!/bin/bash

#exec /sbin/setuser nobody
exec /sbin/setuser nobody mono /opt/NzbDrone/NzbDrone.exe -nobrowser -data=/config
