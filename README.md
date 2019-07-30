# tezos-cli-docker



tezos-cli-docker is a set of scripts to build the tezos-cli tools and containerize them, as well as some convenience scripts to invoke the different binaries. Currently it is a work in progress, so __expect things to break__!

## Features

  - tezos-node convenience script, generates identity before starting the node, if it doesn't already exist.
  - tezos-client wrapper script, simply runs tezos-client and passes all arguments. 
  - more to come, continue reding. 



## Instructions

### Prerequisites
To build the image, you need docker daemon up and running. If you don't know what that is, you're probably on the wrong track. The convenience scripts assume that `bash` exists under `/bin` and you are invoking them from a terminal. Most probably the image will also work under Windows as well, and theoretically Cygwin can invoke the scripts as well, but I can't test this so you're on your own.  

### Building the image
__Note:__ This is the recommended way of working with this repository. There is also a public image, but I do not recommend trusting me (or anybody else) with your private information:

>     # generate your working directory
>     git clone
>     cd tezos-cli-docker
>     # build the image
>     docker build -t tezos-cli-docker .
Grab a coffee, since ocaml has a lot of work to do to build tezos-cli.


### Pulling the image
__Note__: this is a bad idea. You do not want to pull 
an image I created and interact with it. However, it's
kinda safe since it's built on Docker Hub using these sources.

The convenience script will also pull the image (obviously):
>     bin/tezos-node start


### Using the convenience scripts: 
You can now start a node and use tezos-cli to transact with the mainnet. All instructions below are working from inside the repo directory. 

#### start a node:
The following command will start a node, working with the identity file found in `./tezos-node`. If it is the first execution, an identity will be generated and the node will be started afterwards. 
>     bin/tezos-node
Depending on your connection this may take some on first execution, until all data are downloaded. Use the following command to monitor the node's progress:
>     docker logs -f tezosnode


#### run tezos client: 
This will execute tezos-client, which will connect to the already-running node from last step. 
>     bin/tezos-client <args>



### Future work

Things under consideration:
  - wrapper scripts for all binaries
  - more intelligent scripts. 
  - Reduce the image size even further.