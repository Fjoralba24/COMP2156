#!/bin/bash
set -e  # Exit immediately if a command fails

echo "Starting manual deployment..."

git config --global user.email "your-email@example.com"
git config --global user.name "Your Name"

git clone --branch gh-pages https://${GITHUB_TOKEN}@github.com/Fjoralba24/COMP2156.git gh-pages || git clone https://${GITHUB_TOKEN}@github.com/Fjoralba24/COMP2156.git gh-pages
cd gh-pages

# Remove old files
rm -rf *

# Copy new build files
cp -r ../build/* .

# Commit and push
git add .
git commit -m "Deployed via Travis CI"
git push origin gh-pages

echo "Deployment successful!"