#!/bin/sh
set -e

echo "Running migrations"
kong migrations up
echo "Done running migrations"