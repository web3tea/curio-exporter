#!/usr/bin/env bash

# Build sql_exporter if the binary does not exist
if [ ! -f "build/sql_exporter" ]; then
  git clone https://github.com/burningalchemist/sql_exporter.git build
  cd build
  make drivers-minimal
  make build
else
  echo "sql_exporter binary already exists. Skipping build."
fi
