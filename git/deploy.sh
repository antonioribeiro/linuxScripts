#!/bin/bash

echo "pulling main repository..."
git pull

echo "pulling submodules..."
git submodule foreach git pull

echo 
echo "all done."