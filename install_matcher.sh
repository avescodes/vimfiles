#!/bin/bash
mkdir -p bin
cd bin
git clone https://github.com/burke/matcher.git matcher-git
cd matcher-git
make
cd ..
mv matcher-git/matcher .
rm -rf matcher-git
