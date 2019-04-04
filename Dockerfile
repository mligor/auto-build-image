FROM docker:stable

COPY src/ build/
CMD ["/build/build.sh"]
