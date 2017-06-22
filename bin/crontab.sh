#!/bin/bash

cd "$(dirname "$0")"/../

if [[ "$(which rbenv)" == "" ]]; then
  export PATH="~/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

bundle install --quiet
bundle exec rake flare:update



