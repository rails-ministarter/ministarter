A mini-starter Rails 7.0.5 web application

- Devise authentication with DaisyUI forms
- Grafana and Prometheus metrics (using the Yabeda framework)
- Docker container

### How to run the application using Docker

Before starting, make sure you have Docker and Docker Compose installed.

#### Clone the repository

```
git clone https://github.com/rails-starter-docker-app/rails-docker
cd rails-docker
```

#### Setup environment variables

Copy `.env.example` to `.env` in the root directory of the project

```sh
cp .env.example .env
```

And set the environment variables:

```sh
RAILS_DOCKER_POSTGRES_USERNAME=your_postgres_username
RAILS_DOCKER_POSTGRES_PASSWORD=your_postgres_password
```

These values will be used by Docker Compose for database configuration.

#### Build and run the application

Use Docker Compose to build and start the services defined in the `docker-compose.yml` file.

```sh
docker build -t rails-docker .
docker-compose build
docker-compose up
```

This will build the Docker image and start the application and database services.

#### Access the application

The application should now be running at http://localhost:3000.

### How to run tests locally

#### Prepare the test database:

Run the following command to create and set up the test database:

```
rails db:test:prepare
```

*Note: If you update your database schema (e.g., via migrations), you should run this command again to update the schema in the test database.*

Now you can run the tests:

```
rails test
```
