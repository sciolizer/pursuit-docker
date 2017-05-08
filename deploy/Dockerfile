FROM haskell

COPY pursuit /pursuit/pursuit
WORKDIR /pursuit/data
RUN git clone https://github.com/purescript/pursuit-backups.git verified
# ENV PURSUIT_APPDATADIR /database
WORKDIR /pursuit
EXPOSE 3000
CMD ["pursuit"]
# docker run -p 3000:3000 -it pursuit
# docker ip
# curl 192.168.99.100:3000
# only works somewhat... baseref uses localhost, so you still need to map it somehow
# http://stackoverflow.com/questions/36286305/how-do-i-forward-a-docker-machine-port-to-my-host-port-on-osx
