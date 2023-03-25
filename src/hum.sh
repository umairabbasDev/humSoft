#!/bin/bash

VERSION="1.1.0" # Set the version number

if [[ $1 == "-v" ]]; then # Check if the -v flag was passed
  echo "v$VERSION"
  exit 0
fi

# The rest of your script goes here

echo from humSoft