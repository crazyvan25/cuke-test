FROM openjdk:13-jdk-alpine

# Alpine Linux package manager - add utilities
RUN apk add --no-cache curl tar bash

ARG MAVEN_VERSION=3.6.3
ARG ROOT_DIR="/root"
ARG MAVEN_URL=http://apache.mirrors.nublue.co.uk/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz

# Download and extract Maven
RUN mkdir -p /usr/share/maven && \
curl -fsSL $MAVEN_URL | tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# Set Maven environmental variables
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$ROOT_DIR/.m2"

# Speed up Maven JVM
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# Run 'mvn' when running 'docker run'
ENTRYPOINT ["/usr/bin/mvn"]

# Create and set working directory
RUN mkdir -p /usr/src/cuke-test
WORKDIR /usr/src/cuke-test

COPY pom.xml /usr/src/cuke-test

# Run mvn install (this will only run when pom.xml is updated)
RUN mvn -T 1C install && rm -rf target

# Copy remaining source files and keep in image
COPY src /usr/src/cuke-test/src