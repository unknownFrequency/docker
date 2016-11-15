#!/bin/bash
chmod +x /app/bin/*
find /app -type d -exec chmod 0755 {} \; && find . -type f -exec chmod 0644 {} \;

bundle check || bundle install

bundle exec puma
