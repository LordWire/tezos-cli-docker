
FROM ocaml/opam2:ubuntu-lts  as compiler
ARG TZBRANCH=mainnet
RUN git clone https://gitlab.com/tezos/tezos.git && \
    pwd && \
    cd tezos/ && \
    git checkout $TZBRANCH && \
    sudo apt-get update
RUN cd tezos/ &&\ 
    . /etc/profile && \
    eval $(opam env) && \
    make build-deps && \
    eval $(opam env) && \
    make && \
    rm -rf /home/opam/opam-repository/tezos/_build/ && \
    rm -rf /home/opam/opam-repository/tezos/_opam/ && \
    rm -rf ~/.opam/ 
FROM ubuntu:18.04
RUN apt-get update && \
    apt-get -y install libev4 libhidapi-libusb0 && \
    echo "http    80/tcp    www    # WorldWideWeb HTTP" > /etc/services && \
    rm -rf /var/cache/apt/archives
    
COPY --from=compiler /home/opam/opam-repository/tezos/ /tezos/
EXPOSE 8732/tcp

