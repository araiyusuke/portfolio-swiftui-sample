.PHONY: create_table_%
.PHONY: create_seeder_%
.PHONY: seeder_%
.PHONY: create_factory_%
.PHONY: provider_%
.PHONY: create_request_%

	
# create_controller_RegistUser
.PHONY: create_controller_%

tinker:	
	docker-compose exec laravel_service php artisan tinker
create_controller_%:
	docker-compose exec laravel_service php artisan make:controller ${@:create_controller_%=%}Controller --invokable

create_request_%:
	docker-compose exec laravel_service php artisan make:request ${@:create_request_%=%}

confirm_env:
	docker-compose exec laravel_service php artisan env
#  ApiSuccessServiceProvider
provider_%:
	docker-compose exec laravel_service php artisan make:provider ${@:provider_%=%}

clear_cache:
	docker-compose exec laravel_service php artisan config:clear

dump_load:
	docker-compose exec laravel_service composer dump-autoload

# 単数系 先頭大文字
create_model_%:
	docker-compose exec laravel_service php artisan make:model ${@:create_model_%=%}

create_factory_%:
	docker-compose exec laravel_service php artisan make:factory ${@:create_factory_%=%}

fresh:
	docker-compose exec laravel_service php artisan migrate:fresh --seed 

db_reset:
	docker-compose exec laravel_service php artisan migrate:refresh --seed

rollback:
	docker-compose exec laravel_service php artisan migrate:rollback

# 複数形 先頭大文字
create_seeder_%:
	docker-compose exec laravel_service php artisan make:seeder ${@:create_seeder_%=%}TableSeeder

seeder_%:
	docker-compose exec laravel_service php artisan db:seed --class ${@:seeder_%=%}TableSeeder

create_migration_file_%:
	docker-compose exec laravel_service php artisan make:migration create_${@:create_migration_file_%=%}_table --create=${@:create_migration_file_%=%}

update_table_%:
	docker-compose exec laravel_service php artisan make:migration update_${@:update_table_%=%}_table --table=${@:update_table_%=%}

npm_install:
	docker-compose exec nginx /bin/sh

install_doctrine:
	docker-compose exec laravel_service composer require doctrine/dbal

php:
	docker-compose exec laravel bash

start:
	docker-compose up

stop:
	docker-compose stop

uninstall:
	docker-compose down --rmi all --volumes

install:
	docker-compose up --build

build-clear:
	docker-compose build --no-cache

composer_install:
	docker-compose exec laravel_service composer install

composer_update:
	docker-compose exec laravel_service composer update

migration:
	docker-compose exec laravel_service php artisan migrate

destroy:
	docker-compose down --rmi all --volumes --remove-orphans

build:
	docker compose build --no-cache --force-rm

laravel_build:
	docker build -t ecs-hands-on/laravel:latest -f ./docker/laravel/Dockerfile .	

laravel_exec:
	docker run -it ecs-hands-on/laravel:latest bash

test:
	docker-compose exec laravel php ./vendor/bin/phpunit

edit:
	vim docker-compose.yml
 
all_volume_delete:
	docker-compose down
	docker volume rm `docker volume ls -q -f dangling=true`
  
all_image_delete:
	docker-compose down
	docker images -aq | xargs docker rmi