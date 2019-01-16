ARG KANIKO_TAG=debug
FROM gcr.io/kaniko-project/executor:$KANIKO_TAG

COPY src/ build/
ENTRYPOINT [""]
CMD ["/build/build.sh"]
