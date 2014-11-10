#!/bin/bash

#exec /sbin/setuser nobody
exec mono /opt/NzbDrone/NzbDrone.exe -nobrowser -data=/config
