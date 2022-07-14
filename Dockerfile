FROM ubuntu:18.04

RUN sed 's/\/.*com/\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list -i

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y xvfb fonts-wqy-microhei x11vnc novnc supervisor && rm -rf /var/lib/apt/lists

RUN ln -s /usr/share/novnc/vnc_auto.html /usr/share/novnc/index.html

ADD display_server.conf /etc/supervisor/conf.d/display_server.conf

EXPOSE 2333

CMD ["/usr/bin/python", "/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
