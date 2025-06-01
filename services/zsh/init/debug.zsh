#!/bin/sh

# Debug: Export all environment variables

for var in ${(k)parameters}; do
    export $var
done