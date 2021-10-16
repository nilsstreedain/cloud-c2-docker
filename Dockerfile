# Cloud C2 executable version
ARG ARCH=armv7
ARG C2_VERSION=c2-3.1.2_${ARCH}_linux

# Initiates stage one to construct the base for the final image
FROM alpine:latest AS builder

# Specifies the working directory
WORKDIR /app

# Uses apk to install wget an unzip for image construction
RUN apk update \
	&& apk add --no-cache \
	wget \
	unzip

# Adds C2_VERSION to stage one
ARG C2_VERSION

# Grabs a zip of all Cloud C2 versions from Hak5, unzips in /tmp then moves the
# version used for the image to /app
RUN wget -O /tmp/c2.zip https://c2.hak5.org/download/community \
	&& unzip /tmp/c2.zip -d /tmp \
	&& mv /tmp/$C2_VERSION /app

# Initiates stage two to clean unused packages and files from the final image
FROM alpine:latest

# Uses apk to install bash and ca-certificates for the final image
RUN apk update \
	&& apk add --no-cache \
	bash \
	ca-certificates

# Adds C2_VERSION to stage two
ARG C2_VERSION

# Defines environment Docker variables to use in ENTRYPOINT
ENV PATH=/app/$C2_VERSION
ENV HOSTNAME=0.0.0.0

# Copies the version of the Cloud C2 executable used in this image to stage two
COPY --from=builder ${PATH} ${PATH}

# Runs the Cloud C2 executable with specified parameters at each container start
# ENTRYPOINT $PATH -hostname $HOSTNAME

# Tester
ARG TARGETPLATFORM
ENTRYPOINT echo $TARGETPLATFORM

# Opens ports for container use
EXPOSE 2022 8080
