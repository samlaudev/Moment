#!/usr/bin/env bash

# Install ruby using rbenv
ruby_version = `cat .ruby-version`
if [[ ! -d "$HOME/.rbenv/versions/$ruby_version" ]]; then
    rbenv install $ruby_version
fi

# Install bundle
gem install bundle

# Install gems
bundle install

# Install pods
bundle exec pod install
