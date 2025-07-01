FROM sonarqube:25.6.0.109173-community

# Install plugins
ADD https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/25.5.0/sonarqube-community-branch-plugin-25.5.0.jar /opt/sonarqube/extensions/plugins/
USER root
RUN chown sonarqube /opt/sonarqube/extensions/plugins/*.jar

# Fix webapp for sonarqube-community-branch-plugin
RUN apt-get update && \
    apt-get --no-install-recommends -y install unzip && \
    wget https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/25.5.0/sonarqube-webapp.zip && \
    rm -rf /opt/sonarqube/web/* && \
    unzip sonarqube-webapp.zip -d /opt/sonarqube/web && \
    chown -R sonarqube:root /opt/sonarqube/web && \
    chmod -R 550 /opt/sonarqube/web && \
    apt-get remove -y unzip && \
    rm sonarqube-webapp.zip && \
    apt-get clean

USER sonarqube
