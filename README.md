# Project Instructions

Need To Clean All Your Docker?

```bash
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi -f $(docker images -aq)
docker system prune -a --volumes -f
docker network rm $(docker network ls -q)
rm .db-created
rm .db-seeded
rm Gemfile.lock
```

## With Docker

## Putting In Development Mode

Whereas It Is Necessary To Run With Your User, Run

```bash
id -u
```

And Change The Dockerfile.Development File With The Value You Found

So Build You Just Need To Run The First Time:

```bash
chmod 777 Gemfile.lock
docker compose -f docker-compose.development.yml build
```

And To Climb The Application Rode:

```bash
docker compose -f docker-compose.development.yml up
docker compose -f docker-compose.development.yml down
docker compose -f docker-compose.development.yml run app bash
```

## Migrations

To Run Migrations, Tests ... Etc, Run The App With Whatever Is Needed:

```bash
docker compose -f docker-compose.development.yml run app rails db:drop db:create db:migrate
```

## Rails Commands

Example Of Interaction Between Computer And Container:

```bash
docker compose -f docker-compose.development.yml run app rails c
```

## Testing with Docker

For Tests For Example Run `Guard`:

```bash
docker compose -f docker-compose.development.yml run app bundle exec rspec .
```

## Security with Docker

```bash
docker compose -f docker-compose.development.yml run app bin/rubocop -A
docker compose -f docker-compose.development.yml run app bundle exec brakeman
```

## Putting Down

If You Want To Stop The Services:

```bash
docker compose -f docker-compose.development.yml down
```
