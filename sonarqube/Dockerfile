FROM sonarqube:10.6-community
ADD ./sonarqube/sonarqube-community-branch-plugin-1.19.1.jar /opt/sonarqube/extensions/plugins/sonarqube-community-branch-plugin-1.19.1.jar
ADD https://github.com/C4tWithShell/community-rust/releases/download/v0.2.4/community-rust-plugin-0.2.4.jar /opt/sonarqube/extensions/plugins/
USER root
RUN chown sonarqube /opt/sonarqube/extensions/plugins/*.jar
USER sonarqube
