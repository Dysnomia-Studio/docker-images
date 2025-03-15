FROM ghcr.io/dysnomia-studio/net-sdk-9-0:main AS build-env
WORKDIR /app

ARG SONAR_HOST_URL
ARG SONAR_TOKEN
ARG GITHUB_BRANCH
ARG GHP_USER
ARG GHP_TOKEN

# Build Project
COPY . ./

RUN git clone https://github.com/L-U-M-E-N/Lumen.App.git
RUN ls
RUN dotnet restore Lumen.App/Lumen.App.WebAPI/Lumen.App.WebAPI.csproj --ignore-failed-sources /p:EnableDefaultItems=false
RUN dotnet publish Lumen.App/Lumen.App.WebAPI/Lumen.App.WebAPI.csproj --no-restore -c Release -o out
# RUN dotnet-coverage collect 'dotnet test --no-build --verbosity normal Lumen.App/Lumen.App.Sln' -f xml  -o 'coverage.xml'

# Modules - Dependencies
RUN apt update && apt install unzip
RUN mkdir -p out/modules/

## Modules - Youtube
ADD https://github.com/L-U-M-E-N/Lumen.Modules.Youtube/releases/download/6.2.4/Lumen.Modules.Youtube-6.2.4.zip Lumen.Modules.Youtube-6.2.4.zip
RUN unzip Lumen.Modules.Youtube-6.2.4.zip -d out/modules/Lumen.Modules.Youtube-6.2.4/

## Modules - SteamPartner
ADD https://github.com/L-U-M-E-N/Lumen.Modules.SteamPartner/releases/download/6.0.0/Lumen.Modules.SteamPartner-6.0.0.zip Lumen.Modules.SteamPartner-6.0.0.zip
RUN unzip Lumen.Modules.SteamPartner-6.0.0.zip -d out/modules/Lumen.Modules.SteamPartner-6.0.0/

# Build runtime image
FROM ghcr.io/dysnomia-studio/net-runtime-9-0:main
WORKDIR /app
COPY --from=build-env /app/out .
RUN mkdir -p modules/
RUN 
HEALTHCHECK --interval=2m --timeout=3s CMD curl -f http://localhost/ || exit 1
ENTRYPOINT ["dotnet", "Lumen.App.WebAPI.dll"]
