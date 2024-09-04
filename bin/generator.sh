#!/bin/sh

# List of package directories
packages=("presentation" "data" "domain")

cd packages
# Loop through each package directory
for package in "${packages[@]}"
do
  echo "Running build_runner in $package..."

  # Navigate into the package directory
  cd $package

  # Check if the --watch flag is provided
  if [[ "$*" == *"--watch"* ]]; then
      dart run build_runner watch --delete-conflicting-outputs
  else
      dart run build_runner build --delete-conflicting-outputs
  fi

  # Navigate back to the root directory
  cd ..
done

echo "Build_runner execution completed in all packages."