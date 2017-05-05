FROM haskell

RUN git clone https://github.com/purescript/pursuit.git /pursuit-build
WORKDIR /pursuit-build

RUN stack upgrade
RUN stack update

RUN stack setup
RUN stack build --dry-run
RUN stack build --dry-run --prefetch
RUN stack build --fast --keep-going --no-test --no-haddock
RUN stack build --copy-bins

WORKDIR /pursuit
RUN rm -rf /pursuit-build

RUN git --git-dir=/temp.git clone --depth=1 https://github.com/purescript/pursuit-backups.git data/verified
RUN rm -rf /temp.git

EXPOSE 3000
# ENV PURSUIT_APPDATADIR /database
CMD pursuit
# docker run -p 3000:3000 -it pursuit
# docker ip
# curl 192.168.99.100:3000
# only works somewhat... baseref uses localhost, so you still need to map it somehow
# http://stackoverflow.com/questions/36286305/how-do-i-forward-a-docker-machine-port-to-my-host-port-on-osx