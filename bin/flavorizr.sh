#!/bin/sh

cp lib/main.dart lib/main.backup.dart

flutter pub run flutter_flavorizr
echo "Removing unwanted files"
rm -rf lib/main_production.dart
rm -rf lib/main_development.dart
rm -rf lib/app.dart
rm -rf lib/flavors.dart
rm -rf lib/pages
rm -rf .idea/runConfigurations/main_development_dart.xml
rm -rf .idea/runConfigurations/main_production_dart.xml
rm -rf lib/main.dart
mv lib/main.backup.dart lib/main.dart
