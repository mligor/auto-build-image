FROM gliderlabs/herokuish as builder
COPY . /tmp/app
ARG BUILDPACK_URL
ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG FTP_PROXY
ARG NO_PROXY
ENV USER=herokuishuser
RUN /bin/herokuish buildpack build

FROM gliderlabs/herokuish
COPY --from=builder /app /app
ENV PORT=5000
ENV USER=herokuishuser
EXPOSE 5000
CMD ["/bin/herokuish", "procfile", "start", "web"]
