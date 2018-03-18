FROM openjdk

COPY ./config /synthea/config
COPY ./gradle /synthea/gradle
COPY ./lib /synthea/lib
COPY ./src /synthea/src
COPY ./build.gradle /synthea/build.gradle
COPY ./gradlew /synthea/gradlew
COPY ./run_synthea /synthea/run_synthea
COPY ./settings.gradle /synthea/settings.gradle

WORKDIR /synthea

RUN ./gradlew build check test

VOLUME ["/synthea/output"]
ENTRYPOINT ["./run_synthea"]
