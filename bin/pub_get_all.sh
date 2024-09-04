#!/bin/sh

# List of package directories
packages=("presentation" "data" "domain" "di")

cd packages
# Loop through each package directory
for package in "${packages[@]}"
do
  echo "Running pub get in $package..."

  # Navigate into the package directory
  cd $package
  pwd
  flutter pub get

  # Navigate back to the root directory
  cd ..
done

cd ..

pwd
flutter pub get

echo "Flutter pub get completed.."