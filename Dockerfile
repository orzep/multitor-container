FROM debian:13
WORKDIR /opt
RUN apt update #&& apt install build-essential -y
#RUN apt install git texinfo install-info -y
#RUN apt install npm -y
#RUN npm install -g http-proxy-to-socks
#RUN git clone https://github.com/jech/polipo.git && cd polipo
#RUN cd /src/polipo && make && make install
RUN apt install git tor sudo ncat haproxy privoxy -y
RUN git clone https://github.com/trimstray/multitor
RUN chmod +x /opt/multitor/bin/multitor 
RUN cd /opt/multitor && /bin/bash ./setup.sh install
RUN cd /opt/multitor && sed -i 's/127.0.0.1:16379/0.0.0.0:16379/g' templates/haproxy-template.cfg
RUN ln -sf /bin/true /usr/local/bin/polipo
COPY ./runmt .
#RUN chown -R debian-tor /var/lib/multitor
ENV TOR_INSTANCES=2
ENV MT_SOCKS_PORT=9000
ENV MT_CTRL_PORT=9900
#CMD ["/bin/bash"]
#EXPOSE 16379
CMD ["/bin/bash", "/opt/runmt"]
