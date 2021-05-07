#!/usr/bin/env sh

docker build \
--file indexer.Dockerfile \
--tag jk-blacklab-indexer \
.

