#!/usr/bin/env bash

SECONDS=0

# Operate in the directory where this file is located
cd $(dirname $0)

#(rm -rf LeanProject &&
# lake +leanprover/lean4:nightly-2023-02-04 new LeanProject math &&
# cd LeanProject &&
# lake update &&
# lake exe cache get &&
# lake build)

# Build elan image if not already present
docker build --pull --rm -f lean.Dockerfile -t lean:latest .

# Copy info about new versions to the client.
./copy_versions.sh

duration=$SECONDS
echo "Finished in $(($duration / 60)):$(($duration % 60)) min."
echo "Finished in $(($duration / 60)):$(($duration % 60)) min." | logger -t lean4web
