FROM ubuntu:rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install mpd -y && rm -rf /var/lib/apt/lists/*

EXPOSE 6600

CMD ["mpd", "--no-daemon"]
