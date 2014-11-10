#!/bin/bash

chmod 755 /etc/service/sonarr/supervise
chown nobody: /etc/service/sonarr/supervise/ok /etc/service/sonarr/supervise/control /etc/service/sonarr/supervise/status
