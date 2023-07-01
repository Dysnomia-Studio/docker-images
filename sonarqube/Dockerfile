FROM sonarqube:10.1-community
ADD https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.14.0/sonarqube-community-branch-plugin-1.14.0.jar /opt/sonarqube/extensions/plugins/
USER root
RUN chown sonarqube:sonarqube /opt/sonarqube/extensions/plugins/sonarqube-community-branch-plugin-1.14.0.jar
USER sonarqube