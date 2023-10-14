FROM sonarqube:10.2-community
ADD ./sonarqube/sonarqube-community-branch-plugin-1.16.0-SNAPSHOT.jar /opt/sonarqube/extensions/plugins/sonarqube-community-branch-plugin-1.16.0-SNAPSHOT.jar
USER root
RUN chown sonarqube:sonarqube /opt/sonarqube/extensions/plugins/sonarqube-community-branch-plugin-1.16.0-SNAPSHOT.jar
USER sonarqube