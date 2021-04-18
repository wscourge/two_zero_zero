# Project

Ruby on Rails application initialized with [Hix on Rails][hixonrails].

## System dependencies

- Ruby 3.0.1
- Ruby on Rails 6.1.3.1
- Node.js 14.16.1
- MySQL 8.0
- Redis 6.2

## Development dependencies

- `docker` (check `docker --version`): [installation][docker-installation]
- `docker-compose` (check `docker-compose --version`): [installation][docker-compose-installation]

## Configuration

Copy an existing sample environment file. Run:
```bash
cp .env.sample .env
```
And set the `PROJECT_ROOT` variable to the `pwd` of your Rails project root.
Then, spin up the project container running the following:
```bash
docker-compose up --build
```
When it finishes, you can run commands (including `bundle exec rails` commands) in your container.
For example, running the rails console is as simple as:
```bash
docker exec -it project_app bin/rails c
```
And resetting the database:
```bash
docker exec -it project_app bin/rails db:drop db:create db:structure:load:with_data db:seed
```

## Docker services in development

After running `docker-compose up` the following services are exposed:

- Ruby on Rails application at [http://localhost:3001][dev-rails]
- MySQL database at `mysql://project_app:password@localhost:3307`. Use `mysql --user project_app --password password --host=localhost --port 3307 --database project_development`
- Redis at `redis://localhost:6380/0`. Use `redis-cli -h localhost -p 6380 -n 0`
- Mailcatcher UI at [http://localhost:1081][dev-mailcatcher-ui]
- Mailcatcher SMTP at [http://localhost:1026][dev-mailcatcher-smpt]
- Webpack dev server at [http://localhost:3036][dev-webpack-dev-server]

All of the above ports and other settings are configurable via _.env_ file. If you change them, remember to run:
```bash
docker-compose up --build --force-recreate
```
And do update this part of _README.md_.

## How to run the test suite

In order to run the whole test suite, run:

```bash
docker exec -it project_app bundle exec rspec
```

## Code quality checks

The application provides the following code quality analysis tools:

- [Brakeman][brakeman]
- [Fasterer][fasterer]
- [RuboCop][rubocop] with [RuboCop RSpec][rubocop-rspec], [RuboCop Performance][rubocop-performance] and [RuboCop Rails][rubocop-rails]
- [Rails Best Practices][rails-best-practices]
- [Bundler Audit][bundler-audit]

To run them locally:

```bash
docker exec -it project_app bundle exec brakeman
docker exec -it project_app bundle exec fasterer
docker exec -it project_app bundle exec rubocop
docker exec -it project_app bundle exec rails_best_practices
docker exec -it project_app bundle audit
```

[hixonrails]: https://hixonrails.com
[docker-installation]: https://docs.docker.com/get-docker
[docker-compose-installation]: https://docs.docker.com/compose/install
[dev-rails]: http://localhost:3001
[dev-mailcatcher-ui]: http://localhost:1081
[dev-mailcatcher-smtp]: http://localhost:1026
[dev-webpack-dev-server]: http://localhost:3036
[brakeman]: https://github.com/presidentbeef/brakeman
[rubocop]: https://github.com/rubocop-hq/rubocop
[rubocop-performance]: https://github.com/rubocop-hq/rubocop-performance
[rubocop-rspec]: https://github.com/rubocop-hq/rubocop-rspec
[rubocop-rails]: https://github.com/rubocop-hq/rubocop-rails
[fasterer]: https://github.com/DamirSvrtan/fasterer
[rails-best-practices]: https://github.com/flyerhzm/rails_best_practices
[bundler-audit]: https://github.com/rubysec/bundler-audit
