# README

install docker
```
docker-compose build
docker-compose up
docker-compose run web bundle exec rake db:create
docker-compose run web bundle exec rake db:migrate
docker-compose run web bundle exec rake db:setup
```
