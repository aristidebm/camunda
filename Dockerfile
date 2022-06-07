ARG VERSION=7.17.0
ARG DISTRO=tomcat

FROM maven:3.6-alpine as java_builder

RUN mkdir -p /tmp/task-form-embedded/
COPY task-form-embedded/ /tmp/task-form-embedded/
RUN mvn -f /tmp/task-form-embedded/pom.xml clean package

FROM camunda/camunda-bpm-platform:${DISTRO}-${VERSION} as camunda

COPY --from=java_builder /tmp/task-form-embedded/target/"camunda-quickstart-task-form-embedded-0.0.1-SNAPSHOT.war" webapps/
COPY --from=java_builder /tmp/task-form-embedded/target/"camunda-quickstart-task-form-embedded-0.0.1-SNAPSHOT"/ webapps/

