docker run \
-i -t \
-p 81:80 \
-v /home/noxsnono/web-doc/data/www/shipyard/angular_website:/var/www \
-h="Apache2_noxsnono" \
apache2_noxsnono:latest \
bash
