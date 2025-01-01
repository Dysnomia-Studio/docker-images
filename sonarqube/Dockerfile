FROM sonarqube:24.12.0.100206-community
ADD https://github.com/mc1arke/sonarqube-community-branch-plugin/releases/download/1.22.0/sonarqube-community-branch-plugin-1.22.0.jar /opt/sonarqube/extensions/plugins/
ADD https://github.com/C4tWithShell/community-rust/releases/download/v0.2.5/community-rust-plugin-0.2.5.jar /opt/sonarqube/extensions/plugins/
USER root
RUN chown sonarqube /opt/sonarqube/extensions/plugins/*.jar
USER sonarqube
