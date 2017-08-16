docker run -it --rm \
-p 35791:35791 \
-p 51413:51413 \
-P \
-h="D-Torrent" \
-v ~/debian-transmission/downloads:/home/debian-transmission/downloads \
-v ~/debian-transmission/config:/home/debian-transmission/config \
-v ~/debian-transmission/torrents:/var/lib/transmission-daemon/info/torrents \
noxsnono/torrent:v000001 \
bash
