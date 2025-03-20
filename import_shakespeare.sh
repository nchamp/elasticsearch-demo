#!/usr/bin/env bash

curl -s \
  -H "Content-Type: application/json" \
  -XPOST localhost:9200/_bulk?pretty \
  --data-binary @shakespeare-data.json