FROM sonarqube:10.1-community
ADD ./sonarqube/sonarqube-community-branch-plugin-1.16.0-SNAPSHOT.jar /opt/sonarqube/extensions/plugins/sonarqube-community-branch-plugin-1.16.0-SNAPSHOT.jar
ADD https://github.com/elegoff/sonar-rust/releases/download/v0.2.2/community-rust-plugin-0.2.2.jar /opt/sonarqube/extensions/plugins/
USER root
RUN chown sonarqube:sonarqube /opt/sonarqube/extensions/plugins/*.jar
USER sonarqube
