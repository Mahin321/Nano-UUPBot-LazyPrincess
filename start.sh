#!/bin/bash

if [ -z "$UPSTREAM_REPO" ]; then
  echo "Cloning main Repository"
  git clone https://github.com/lazyindu/test1.git /LazyPrincess
else
  echo "Cloning Custom Repo from $UPSTREAM_REPO"
  git clone "$UPSTREAM_REPO" /LazyPrincess
fi

cd /LazyPrincess || exit 1
pip3 install -U -r requirements.txt || exit 1

echo "Starting Bot..."
python3 bot.py
