#!/bin/bash

declare -A REPOS
REPOS["stable/main"]="../neoterm-packages/debs"
REPOS["stable/extra"]="../neoterm-extra-packages/debs"

GATHER_ARCH=(aarch64 all) 

