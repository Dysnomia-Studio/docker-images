FROM sonarqube:10.4-community
ADD https://github.com/iSergio/sonarqube-community-branch-plugin/releases/download/1.16.1/sonarqube-community-branch-plugin-1.16.1-SNAPSHOT.jar /opt/sonarqube/extensions/plugins/
ADD https://github.com/elegoff/sonar-rust/releases/download/v0.2.2/community-rust-plugin-0.2.2.jar /opt/sonarqube/extensions/plugins/
USER root
RUN chown sonarqube:sonarqube /opt/sonarqube/extensions/plugins/*.jar
USER sonarqube
