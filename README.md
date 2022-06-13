# README

install docker

1. How to set up
```
docker-compose build
docker-compose up
docker-compose run rails bundle exec rake db:create
docker-compose run rails bundle exec rake db:migrate
docker-compose run rails bundle exec rake db:setup
```

2. test
```
docker-compose run rails bundle exec rspec spec/
```
