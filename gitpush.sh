#!/bin/bash

# Prompt for commit message
read -p "Enter commit message: " message

# Run commands with specified message
git add .
git commit -m "$message"
git push