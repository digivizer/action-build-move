#!/bin/sh -l

echo "Running command on the application."

convox builds export $INPUT_BUILD -a $INPUT_APP -r $INPUT_SOURCE | convox builds import -a $INPUT_APP -r $INPUT_DESTINATION
