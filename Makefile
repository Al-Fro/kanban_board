docker-test:
	docker-compose run --rm web rails t

docker-bash:
	docker-compose run --rm web bash -i

docker-dev:
	docker-compose -f docker-compose.yml up

docker-stop:
	docker-compose down

docker-production-setup:
	docker-compose build --build-arg RAILS_ENV="production"
	docker-compose run --rm web bash -ic " \
		bundle i; \
		RAILS_ENV=production bundle exec rake db:create db:migrate"
