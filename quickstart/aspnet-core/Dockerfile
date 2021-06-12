FROM registry.redhat.io/ubi8/dotnet-50-runtime

USER 0

COPY publish /opt/app-root/app
RUN chown -R 1001:0 /opt/app-root/app

USER 1001
CMD /opt/app-root/app/ContosoTeamStats
