# Force update this image, we make a local copy, so we can disable auto pulling with other images
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app

RUN apt-get update
RUN apt-get install -y curl
HEALTHCHECK --interval=5m --timeout=3s CMD curl -f http://localhost/ || exit 1