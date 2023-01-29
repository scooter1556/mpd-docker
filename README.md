# MPD Docker Image

Simple Music Player Daemon (MPD) image for Docker tracking latest Ubuntu rolling package version.

## Setup
It's recommended to create a dedicated directory on the host for storing MPD config, database and state files.

    mkdir -p /etc/mpd
    
Download the example config to the MPD directory

    curl https://raw.githubusercontent.com/scooter1556/mpd-docker/main/mpdconf.example > /etc/mpd/mpd.conf

Modify the configuration as needed following [MPD Documentation](https://mpd.readthedocs.io/en/latest/index.html)

## Docker
    docker run -d --name mpd -v /etc/mpd/mpd.conf:/etc/mpd.conf -v /etc/mpd:/etc/mpd -v /Path/To/Your/Music:/var/lib/mpd/music -p 6600:6600 --device /dev/snd --cap-add=sys_nice scootsoftware/mpd

## Docker Compose

    version: '3'
    services:
    mpd:
        container_name: mpd
        image: scootsoftware/mpd
        volumes:
          - /etc/mpd/mpd.conf:/etc/mpd.conf
          - /etc/mpd:/etc/mpd
          - /Path/To/Your/Music:/var/lib/mpd/music
          - /Path/To/Your/Playlists:/var/lib/mpd/playlist
        restart: unless-stopped
        ports:
          - "6600:6600"
        devices:
          - /dev/snd:/dev/snd
        cap_add:
          - SYS_NICE
