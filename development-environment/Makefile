MIGRATION_USERNAME=db-test
MIGRATION_PASSWORD=db-test123
DATABASE_URL=jdbc:postgresql://localhost:5435/db-test

# Run migration for development environment
migration:
	 mvn flyway:migrate -Dflyway.user=$(MIGRATION_USERNAME) -Dflyway.url=$(DATABASE_URL) -Dflyway.password=$(MIGRATION_PASSWORD) -f ../pom.xml

# Run validate for development environment
validate-migration:
	 mvn flyway:validate -Dflyway.user=$(MIGRATION_USERNAME) -Dflyway.url=$(DATABASE_URL) -Dflyway.password=$(MIGRATION_PASSWORD) -f ../pom.xml

# execute build without tests and run the application with development profile
run:
	mvn spring-boot:run -Dspring-boot.run.profiles=development -f ../pom.xml

# create the containers for development environment
compose-up:
	docker-compose -p db-test_environment up -d

# remove the containers
compose-down:
	docker-compose -p db-test_environment down

# Start the application locally and environment
start: migration run

# Start  The Environment
start-environment: compose-down compose-up migration

