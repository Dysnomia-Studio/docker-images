FROM mcr.microsoft.com/dotnet/sdk:7.0
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
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs jq

# Install dotnet-coverage
RUN dotnet tool install --global dotnet-coverage