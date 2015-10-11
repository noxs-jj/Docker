docker run -it --rm \
-p 35791:35791 \
-P \
-h="D-Torrent" \
-v ~/debian-transmission/downloads:/home/debian-transmission/downloads \
-v ~/debian-transmission/config:/home/debian-transmission/config \
-v ~/debian-transmission/torrents:/home/debian-transmission/torrents \
noxsnono/torrent:v000001 \
bash
