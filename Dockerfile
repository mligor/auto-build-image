FROM docker:stable

RUN apk add bash
COPY src/ build/
CMD ["/build/build.sh"]
