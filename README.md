# Docker sonarr (previously NzbDrone)

Exposes port 8989 - web interface

Volume /config - Sonarr's configuration database

Volume /media - Media files to import

## Running

The quickest way to get it running without integrating with a download client or media server (plex)
```
sudo docker run --name sonarr -v /path/to/your/config/folder/:/config -v /path/to/your/media/folder/:/media -p 8989:8989 tuxeh/sonarr
```

You can link to the download client container's volumes and plex using something similar:
```
sudo docker run --name sonarr -v /path/to/your/config/folder/:/config -v /path/to/your/media/folder/:/media --volumes-from deluge --link plex:plex --link deluge:deluge -p 8989:8989 tuxeh/sonarr
```

## Configuring

By default, this container will use the Sonarr master branch. To change branches and update successfully, you must configure Sonarr to use the update script in ```/etc/service/sonarr/update.sh```. This is configured under Settings > (show advanced) > General > Updates > change Mechanism to Script.

The configuration folder on the host must be readable/writable by the nobody user.
