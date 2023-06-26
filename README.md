A mini-starter Rails 7.0.5 web application

* Devise authentication with DaisyUI forms
* Grafana and Prometheus metrics (using the Yabeda framework)
* Docker container

### How to run the application using Docker

Before starting, make sure you have Docker and Docker Compose installed.

##### Clone the repository

```
git clone https://github.com/rails-starter-docker-app/rails-docker.git
cd rails-docker
```

##### Setup Environment Variables

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

##### Build and Run the Application

Use Docker Compose to build and start the services defined in the `docker-compose.yml` file.

```sh
docker build -t rails-docker .
docker-compose build
docker-compose up
```

This will build the Docker image and start the application and database services.

##### Access the Application

Once the containers are up and running, you can access the application and Grafana in your browser.

* Application: http://localhost:4000
* Grafana: http://localhost:3000

#### Setting up Grafana

To monitor the application with Grafana, you will need to add Prometheus as a data source.

* Log in to Grafana (default credentials are `admin`/`admin`).
* Go to `Configuration` > `Data Sources` from the left-hand menu.
* Click `Add data source` and select `Prometheus`.
* In the HTTP section, set the URL to http://prometheus:9090 (as defined in docker-compose.yml) and click `Save & Test`.

### How to run tests locally

##### Prepare the Test Database:

Run the following command to create and set up the test database:

```
rails db:test:prepare
```

*Note: If you update your database schema (e.g., via migrations), you should run this command again to update the schema in the test database.*

Now you can run the tests with the following command:

```
rails test
```
