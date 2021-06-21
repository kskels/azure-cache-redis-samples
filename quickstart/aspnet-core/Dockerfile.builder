FROM registry.redhat.io/ubi8/dotnet-50 AS builder

USER 0

COPY ContosoTeamStats /tmp/ContosoTeamStats
RUN cd /tmp/ContosoTeamStats \
  && dotnet publish -c Release -o publish \
  && chown -R 1001:0 /tmp/ContosoTeamStats


FROM registry.redhat.io/ubi8/dotnet-50-runtime

COPY --from=builder /tmp/ContosoTeamStats/publish /opt/app-root/app
CMD /opt/app-root/app/ContosoTeamStats
