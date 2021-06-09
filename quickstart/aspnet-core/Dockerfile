FROM registry.access.redhat.com/ubi8/dotnet-50

USER 0

COPY ContosoTeamStats /tmp/src
RUN chown -R 1001:0 /tmp/src

USER 1001
RUN /usr/libexec/s2i/assemble
CMD /usr/libexec/s2i/run
