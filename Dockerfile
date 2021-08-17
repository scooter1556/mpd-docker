FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install mpd -y && rm -rf /var/lib/apt/lists/*
RUN mkdir /run/mpd

EXPOSE 6600

CMD ["mpd", "--no-daemon"]
