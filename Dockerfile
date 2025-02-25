FROM ubuntu

RUN apt-get update && \
    apt-get -y install gcc libc6-dev zlib1g-dev curl bash && \
    rm -rf /var/lib/apt/lists/*

# Latest version of GraalVM (at the time of writing)
ENV GRAAL_VERSION 19.3.0
ENV GRAAL_VERSION_UNZIP 19.0.0
ENV GRAAL_FILENAME graalvm-ce-java8-linux-amd64-${GRAAL_VERSION}.tar.gz

# Download GraalVM
RUN curl -4 -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAAL_VERSION}/${GRAAL_FILENAME} -o /tmp/${GRAAL_FILENAME}


# Untar and move the files we need:
RUN tar -zxvf /tmp/${GRAAL_FILENAME} -C /tmp 
RUN mv /tmp/graalvm-ce-java8-${GRAAL_VERSION} /usr/lib/graalvm

RUN rm -rf /tmp/*
RUN /usr/lib/graalvm/bin/gu install native-image

# Create a volume to which we can mount to build:
VOLUME /project
WORKDIR /project

# And finally, run native-image
ENTRYPOINT ["/usr/lib/graalvm/bin/native-image"]
