docker run --name squid3 -d --restart=always \
--publish 61884:3128 \
--volume /var/squid3/squid.conf:/etc/squid3/squid.conf \
--volume /var/squid3/passwords:/etc/squid3/passwords \
--volume /srv/docker/squid/cache:/var/spool/squid3 \
zachm/squid
