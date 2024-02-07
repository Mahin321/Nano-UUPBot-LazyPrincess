#!/bin/bash

# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Clone repository and install dependencies
if [ -z "$UPSTREAM_REPO" ]; then
  echo "Cloning main Repository"
  git clone https://github.com/lazyindu/test1.git /LazyPrincess
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO"
  git clone "$UPSTREAM_REPO" /LazyPrincess
fi

cd /LazyPrincess || exit 1
pip install -U -r requirements.txt || exit 1

echo "Starting Bot..."
python3 bot.py
tr -d '\r' < start.sh > temp_file && mv temp_file start.sh
