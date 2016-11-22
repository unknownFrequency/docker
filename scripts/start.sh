#!/bin/bash
bundle check || bundle install
bundle exec puma
chmod +x bin/*
