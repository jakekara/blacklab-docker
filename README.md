# Using Blacklab in Docker

This repo contains scripts to get up and running quickly with Blacklab in
Docker. I created two docker images: an indexer and a server. The indexer image
is used to take your input texts and index them. The server image is what you
use once you have an index folder generated.

## Quickstart

Clone this repo and cd into it:

```bash
git clone https://github.com/jakekara/blacklab-docker.git
cd blacklab-docker
```

Then make a folder called texts and copy some text files into it. If you don't
have any, use the `curl-shakespeare.sh` script to download the complete works of
Bill Shakespeare from Project Gutenberg (curl required):

```bash
. scripts/curl-shakespeare.txt
```
or

```bash
mkdir texts
cp -r YOUR_TEXT_DIR/*.txt texts
```

Next, build your indexer image.

```bash
. ./scripts/build-indexer.sh
# This whill take a while....
```

Then index your texts:

```bash
. ./scripts/run-indexer.sh
```

This should make a folder on your host machine called ./cqlindex that contains a bunch of weird internal Blacklab stuff.

Now build your server image

```bash
. ./scripts/build-server.sh
# This will take a while...
```

Finally, run your server

```bash
. ./scripts/run-server.sh
```

Now you should be able to access your Blacklab instance API at localhost port 8888. Here's an example query:

`http://localhost:8888/blacklab-server-1.7.3/cqlindex/hits?patt=%22romeo%22&outputformat=json`

## Re-running

Next time you want to fire up an instance with new data, just replace the text in your text directory and re-run the two "run-*" scripts. There's no need to rebuild the images themselves. This will save a lot of time.

```bash
. ./scripts/run-indexer.sh
. ./scripts/run-server.sh
```

## TODO

Eventually I may just push these images to Dockerhub so there is no need to
build them manually.
