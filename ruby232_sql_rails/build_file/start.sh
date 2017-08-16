cd /app
bundle install --full-index
rake db:drop db:create db:migrate db:seed
rails s -b 0.0.0.0 -p 3000
