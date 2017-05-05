FROM haskell

RUN stack upgrade
RUN stack update
RUN stack --version
RUN git clone https://github.com/purescript/pursuit.git
WORKDIR /pursuit
RUN stack build --dry-run
RUN stack build --dry-run --prefetch
COPY dep.sh /pursuit/dep.sh
RUN chmod +x dep.sh
RUN /pursuit/dep.sh mtl
RUN ./dep.sh regex-base
RUN ./dep.sh text
RUN ./dep.sh regex-tdfa
RUN ./dep.sh old-time
# base-compat, dlist, hashable, integer-logarithms, primitive, time-locale-compat, transformers-compat, tagged, unordered-containers, vector, scientific, attoparsec
RUN ./dep.sh aeson
# blaze-builder, blaze-markup, blaze-svg
RUN ./dep.sh barrier
RUN ./dep.sh directory
# base64-bytestring, case-insensitive, data-default-class, cookie, http-types, mime-types, network, network-uri, process, random, stm, async, exceptions, zlib, streaming-commons, http-client
RUN ./dep.sh http-client
# byteable, cereal, hourglass, memory, asn1-types, asn1-encoding, asn1-parse, cryptonite, pem, socks, x509, x509-store, x509-system, x509-validation, tls, connection
RUN ./dep.sh http-client-tls
# mmorph, transformers-base, monad-control, lifted-base, resourcet, conduit, conduit-extra
RUN ./dep.sh http-conduit
# ansi-terminal, ansi-wl-pprint, optparse-applicative
RUN ./dep.sh optparse-applicative
RUN ./dep.sh pipes
RUN ./dep.sh pipes-http
# Cabal, Glob, SHA, StateVar, appar, auto-update, base-orphans, blaze-html, byteorder, bytestring-builder, cabal-doctest, clock, cmdargs, aeson-pretty, css-text, data-default-instances-containers, data-default-instances-dlist, data-default-instances-old-locale, data-default, data-ordlist, distributive, easy-file, edit-distance, entropy, file-embed, gitrev, happy
RUN ./dep.sh purescript
RUN ./dep.sh websockets
RUN ./dep.sh yesod
RUN ./dep.sh yesod-core
RUN ./dep.sh yesod-static
RUN ./dep.sh yesod-form
RUN ./dep.sh classy-prelude
RUN ./dep.sh classy-prelude-conduit
RUN ./dep.sh classy-prelude-yesod
RUN ./dep.sh bytestring
RUN ./dep.sh bytestring-trie
RUN ./dep.sh text
RUN ./dep.sh template-haskell
RUN ./dep.sh shakespeare
RUN ./dep.sh hjsmin
RUN ./dep.sh monad-control
RUN ./dep.sh wai-extra
RUN ./dep.sh yaml
RUN ./dep.sh http-conduit
RUN ./dep.sh deepseq
RUN ./dep.sh directory
RUN ./dep.sh warp
RUN ./dep.sh data-default
RUN ./dep.sh conduit
RUN ./dep.sh monad-logger
RUN ./dep.sh fast-logger
RUN ./dep.sh wai-logger
RUN ./dep.sh parallel
RUN ./dep.sh parsec
RUN ./dep.sh file-embed
RUN ./dep.sh safe
RUN ./dep.sh unordered-containers
RUN ./dep.sh containers
RUN ./dep.sh vector
RUN ./dep.sh time
RUN ./dep.sh bower-json
RUN ./dep.sh blaze-builder
RUN ./dep.sh blaze-markup
RUN ./dep.sh blaze-html
RUN ./dep.sh blaze-svg
RUN ./dep.sh filepath
RUN ./dep.sh dlist
RUN ./dep.sh cheapskate
RUN ./dep.sh split
RUN ./dep.sh shakespeare
RUN ./dep.sh colour
RUN ./dep.sh hxt
RUN ./dep.sh base64-bytestring
RUN ./dep.sh http-types
RUN ./dep.sh case-insensitive
RUN ./dep.sh conduit-extra
RUN ./dep.sh aeson-better-errors
RUN ./dep.sh exceptions
RUN ./dep.sh transformers
RUN ./dep.sh cookie
RUN ./dep.sh xss-sanitize
RUN ./dep.sh barrier
RUN ./dep.sh mono-traversable
RUN ./dep.sh streaming-commons
RUN ./dep.sh foreign-store
RUN ./dep.sh yesod-test
RUN ./dep.sh yesod-core
RUN ./dep.sh yesod
RUN ./dep.sh hspec

RUN ./dep.sh
RUN apt-get update
RUN apt-get -y install curl
EXPOSE 3000
WORKDIR /pursuit/data
RUN git clone https://github.com/purescript/pursuit-backups.git verified
# ENV PURSUIT_APPDATADIR /database
WORKDIR /pursuit
CMD stack exec pursuit
# docker run -p 3000:3000 -it pursuit
# docker ip
# curl 192.168.99.100:3000
# only works somewhat... baseref uses localhost, so you still need to map it somehow
# http://stackoverflow.com/questions/36286305/how-do-i-forward-a-docker-machine-port-to-my-host-port-on-osx