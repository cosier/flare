#!/bin/bash

cd "$(dirname "$0")"/../

export PATH="~/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

bundle exec rake flare:update



