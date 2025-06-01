#!/bin/bash

openssl rand -base64 18 | tr -dc 'a-zA-Z0-9' | fold -w6 | head -3 | paste -sd '-'