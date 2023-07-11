A mini-starter Rails 7.0.6 web application

- Devise authentication with DaisyUI forms
- Grafana and Prometheus metrics (using the Yabeda framework)
- Docker container

### How to run the application using Docker

Before starting, make sure you have Docker and Docker Compose installed.

#### Clone the repository

```
git clone https://github.com/rails-ministarter/rails-ministarter
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

Once the containers are up and running, you can access the Rails application and Grafana in your browser.

* Rails application http://localhost:4000
* Grafana http://localhost:3000
* Prometheus http://localhost:9090

Grafana is provisioned with the default Prometheus data source via `grafana/datasources/datasources.yaml`. To test the connection,

* Log in to Grafana (`admin`/`admin`)
* Navigate to `Home` > `Connections` > `Data Sources`
* Select `DS_PROMETHEUS`, scroll down and click on the `Test` button. Grafana will try to connect to the Prometheus instance and fetch some data. If everything is set up correctly, you should see `Successfully queried the Prometheus API.`.

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

#### CI/CD

In order to enable the automatic upload of Docker images to Docker Hub through the CI/CD pipeline, you must configure the following environment variables in GitHub Actions:

- `DOCKER_HUB_NAMESPACE`
- `DOCKER_HUB_REPOSITORY`
- `DOCKER_PASSWORD`
- `DOCKER_USERNAME`
