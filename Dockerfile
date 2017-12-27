# Use Docker 17.05 or later with multi-stage builds support

FROM alpine:3.6 as temp
RUN apk --no-cache add curl unzip ca-certificates
RUN curl -sLo rclone.zip https://downloads.rclone.org/rclone-current-linux-amd64.zip
RUN unzip -j rclone.zip *rclone
RUN chmod +x rclone

FROM alpine:3.6
COPY --from=temp /rclone /usr/bin/rclone
ENTRYPOINT ["/usr/bin/rclone"]
CMD ["--help"]
