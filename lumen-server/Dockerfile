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
#RUN dotnet sonarscanner begin /k:"lumen-app" /d:sonar.host.url="$SONAR_HOST_URL" /d:sonar.token="$SONAR_TOKEN" /d:sonar.cs.vscoveragexml.reportsPaths=coverage.xml /d:sonar.coverage.exclusions="**Test*.cs" /d:sonar.branch.name="$GITHUB_BRANCH" /d:sonar.qualitygate.wait=true
RUN dotnet restore Lumen.App/Lumen.App.WebAPI/Lumen.App.WebAPI.csproj --ignore-failed-sources /p:EnableDefaultItems=false
RUN dotnet publish Lumen.App/Lumen.App.WebAPI/Lumen.App.WebAPI.csproj --no-restore -c Release -o out
# RUN dotnet-coverage collect 'dotnet test --no-build --verbosity normal Lumen.App/Lumen.App.Sln' -f xml  -o 'coverage.xml'
#RUN dotnet sonarscanner end /d:sonar.token="$SONAR_TOKEN"

# Modules
RUN apt update && apt install unzip
RUN mkdir -p out/modules/Lumen.Modules.Youtube-6.1.0/
ADD https://github.com/L-U-M-E-N/lumen-module-youtube/releases/download/6.1.0/Lumen.Modules.Youtube-6.1.0.zip Lumen.Modules.Youtube-6.1.0.zip
RUN unzip Lumen.Modules.Youtube-6.1.0.zip -d Lumen.Modules.Youtube-6.1.0/
RUN mv Lumen.Modules.Youtube-6.1.0/out/* out/modules/Lumen.Modules.Youtube-6.1.0/

# Build runtime image
FROM ghcr.io/dysnomia-studio/net-runtime-9-0:main
WORKDIR /app
COPY --from=build-env /app/out .
RUN mkdir -p modules/
RUN 
HEALTHCHECK --interval=2m --timeout=3s CMD curl -f http://localhost/ || exit 1
ENTRYPOINT ["dotnet", "Lumen.App.WebAPI.dll"]