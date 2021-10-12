#!/bin/bash

set -e

cd "$(dirname "$0")"

lineLength=100

# lib
libFolder="../lib"

command="dart format -l $lineLength -o none --set-exit-if-changed $libFolder"

$command

#test
testFolder="../test"

command="dart format -l $lineLength -o none --set-exit-if-changed $testFolder"

$command
