FROM archlinux

RUN pacman -Syu mpd alsa-utils --noconfirm
RUN find /var/cache/pacman/ -type f -delete

EXPOSE 6600

CMD ["mpd", "--stdout", "--no-daemon"]
