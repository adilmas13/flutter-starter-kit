#!/bin/sh


./bin/pub_get_all.sh

echo "Creating env files.."

if [ ! -f ".env.production" ]; then
    cp .env.sample .env.production
    echo ".env.production created"
else
    echo ".env.production already exists, skipping creation"
fi

# Check if .env.development doesn't exist, then copy
if [ ! -f ".env.development" ]; then
    cp .env.sample .env.development
    echo ".env.development created"
else
    echo ".env.development already exists, skipping creation"
fi
