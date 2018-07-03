FROM ubuntu:18.04

## prereqs
RUN apt-get update && \
    apt-get install -y make git wget curl bubblewrap unzip build-essential m4 rsync && \
    rm -rf /var/lib/apt/lists/* && \
    curl -sL https://raw.githubusercontent.com/ocaml/opam/master/shell/install.sh -o install.sh && \
    sh -c '/bin/echo -e "\n" | sh install.sh' && \
    opam init --disable-sandboxing --yes && \
    eval $(opam env) && \
    echo 'eval $(opam env)' >> ~/.bashrc && \
    git clone https://gitlab.com/tezos/tezos.git && \
    cd tezos/ && \
    git checkout betanet && \
    eval $(opam env)  && \
    apt-get update && \
    make build-deps && \
    eval $(opam env)  && \
    make && \
    rm -rf /tezos/_build/ && \
    rm -rf /tezos/_opam/ && \
    rm -rf /root/.opam/ && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 8732/tcp
