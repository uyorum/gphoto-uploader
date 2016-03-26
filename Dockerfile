FROM debian:8

RUN sed -i 's/http:\/\/.*\/debian/http:\/\/ftp\.jp\.debian\.org\/debian/g' /etc/apt/sources.list && \
      dpkg --add-architecture i386 && \
      apt-get update && \
      apt-get install -y wget x11vnc wine xvfb locales xz-utils && \
      apt-get clean
RUN echo ja_JP.UTF-8 UTF-8  >> /etc/locale.gen && \
      echo en_US.UTF-8 UTF-8  >> /etc/locale.gen && \
      locale-gen
RUN cd /tmp && \
      wget http://jaist.dl.osdn.jp/vlgothic/62375/VLGothic-20141206.tar.xz && \
      tar Jxvf VLGothic-20141206.tar.xz && \
      mkdir -p /root/.wine/drive_c/windows/Fonts && \
      cp -rp VLGothic/VL-Gothic-Regular.ttf /root/.wine/drive_c/windows/Fonts/ && \
      rm -rf VLGothic*
ENV LANG=ja_JP.UTF-8
RUN cd /tmp && \
      wget https://dl.google.com/dl/picasa/gpautobackup_setup.exe && \
      mkdir /upload

COPY bootstrap.sh /
COPY gphoto.reg /tmp/

CMD ["/bootstrap.sh"]
