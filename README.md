# Docker sonarr (previously NzbDrone)

### Ports
|   |  Port  |  Comment |
|----------|-------------|------|
| TCP |  8989  | Web Interface |

### Volumes
| Path |  Comment  |
|----------|-------------|
| /volumes/config | Sonarr configuration data |
| /volumes/completed | Completed downloads from download client |
| /volumes/media | Sonarr media folder |

## Running

The quickest way to get it running without integrating with a download client or media server (plex)
```
sudo docker run --restart always --name sonarr -p 8989:8989 -v /path/to/your/media/folder/:/volumes/media -v /path/to/your/completed/downloads:/volumes/completed tuxeh/sonarr
```

You can link to the download client container's volumes and plex using something similar:
```
sudo docker run --restart always --name sonarr_test -p 8989:8989 --link plex:plex --volumes-from deluge --link deluge:deluge -p 8989:8989 tuxeh/sonarr

sudo docker run --name sonarr -v /path/to/your/media/folder/:/volumes/media --volumes-from deluge --link plex:plex --link deluge:deluge -p 8989:8989 tuxeh/sonarr
```

## Configuring

By default, this container will use the Sonarr master branch. To change branches and update successfully, you must configure Sonarr to use the update script in ```/sonarr-update.sh``. This is configured under Settings > (show advanced) > General > Updates > change Mechanism to Script.

