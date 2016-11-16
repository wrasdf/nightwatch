#!/usr/bin/env bash
set -e

if [ ! -z $(pgrep Xvfb) ]; then
  kill -9 $(pgrep Xvfb)
fi

nohup /usr/bin/Xvfb :99 -screen 0 1280x1024x24 &
