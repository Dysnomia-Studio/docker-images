FROM mcr.microsoft.com/dotnet/sdk:5.0
WORKDIR /app

# Install sonarScanner
RUN dotnet tool install --global dotnet-sonarscanner
ENV DOTNET_ROLL_FORWARD=Major
ENV PATH="${PATH}:/root/.dotnet/tools"

# Install sonarScanner dependencies
RUN apt-get update
# Next line fix openjdk11 install
RUN mkdir -p /usr/share/man/man1
RUN apt install openjdk-11-jdk -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# Download pre-release version _20200601~deb10u2_ of the Debian 'buster' ca-certificates
RUN wget -O ./20200601~deb10u2_all.deb https://deb.debian.org/debian/pool/main/c/ca-certificates/ca-certificates_20200601~deb10u2_all.deb

# Validate the SHA-256 checksum of the downloaded package
## sha256sum 20200601~deb10u2_all.deb
RUN echo "a9e267a24088c793a9cf782455fd344db5fdced714f112a8857c5bfd07179387 20200601~deb10u2_all.deb" | sha256sum -c -

RUN dpkg -i 20200601~deb10u2_all.deb