docker run \
--rm -it \
-P \
-v $1:/app \
--name "noxsnono-rails" \
noxsnono/rails:last
