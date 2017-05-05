FROM haskell

COPY download-docs.sh /download-docs.sh
RUN /download-docs.sh
RUN rm /download-docs.sh

COPY build-pursuit-bin.sh /build-pursuit-bin.sh
RUN /build-pursuit-bin.sh
RUN rm /build-pursuit-bin.sh

WORKDIR /pursuit
EXPOSE 3000
# ENV PURSUIT_APPDATADIR /database
CMD pursuit
# docker run -p 3000:3000 -it pursuit
# docker ip
# curl 192.168.99.100:3000
# only works somewhat... baseref uses localhost, so you still need to map it somehow
# http://stackoverflow.com/questions/36286305/how-do-i-forward-a-docker-machine-port-to-my-host-port-on-osx