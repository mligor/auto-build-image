FROM docker:stable

RUN apk add bash ruby
COPY src/ build/
CMD ["/build/build.sh"]
