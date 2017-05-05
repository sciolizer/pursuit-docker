FROM haskell

RUN git clone https://github.com/purescript/pursuit.git
WORKDIR /pursuit
RUN stack exec pursuit
