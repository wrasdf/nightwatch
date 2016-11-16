#!/usr/bin/env bash
set -e

cleanup() {
  docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc
  rm -rf .com.google.Chrome*
  rm -rf .org.chromium.Chromium*  
}
trap cleanup EXIT
cleanup

docker run --rm -v $(pwd):/root/app -w /root/app ikerry/chrome-standalone:0.0.3 bash -c "npm install && npm run test_ci"
