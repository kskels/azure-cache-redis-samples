FROM registry.redhat.io/ubi8/dotnet-50-runtime

USER 0

COPY ContosoTeamStats/bin/Release/net5.0/publish /opt/app-root/app
RUN chown -R 1001:0 /opt/app-root/app

USER 1001
CMD dotnet /opt/app-root/app/ContosoTeamStats.dll
