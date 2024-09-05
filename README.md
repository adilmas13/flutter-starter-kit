# flutter_starter_kit

Starter kit for flutter projects

## Prerequisite
1. [Flutter](https://docs.flutter.dev/get-started/install)
2. [Android Studio](https://developer.android.com/studio)
3. [XCode](https://developer.apple.com/xcode/)

## Getting Started
1. Run setup
   ```sh
   ./bin/setup.sh
   ```
2. After fork do the following
   - Update `.firebase/production` and `.firebase/development` with the required `google-services.json` and `GoogleService-Info.plist`
   - Update `packages/data/lib/src/firebase_config` with the correct firebase configuration. Use [flutterfire](https://firebase.google.com/docs/flutter/setup) is needed.
   - Update `flavorizr.yaml` with the required details.
   - Run command to create/update the necessary environment.
     ```sh
     ./bin/flavorizr.sh
     ```
3. Get or create the required `.env.production` and `.env.development` in the root folder.

## Understanding the project
1. The project follows some what clean architecture (usecases not included)
   - `packages/presentation`
      - Every page widget should compulsory extend `BaseStatefulPageWidget`
      - Every page widget will have its own PageStore which should extend `BasePageStore`       
   - `packages/domain`
      - sanitized dto 
   - `packages/data`
      - Any rest datasource should extend `BaseRemoteDataSource`
      - Repository should extend `BaseRepository` 
   - `packages/di` (additional for dependency injection)
      - configure dependency tree 
  
2. The project has two environments, `development` and `production`. This can be extended to create more environments
   - Add the required `.env.production` and `.env.development`
   - `main.development.dart`
   - `main.production.dart`
   - The project is already configured to run the two environments which can be found under `.run`

3. The app is structured to report errors via `firebase_crashlytics` which can we easily replaced with any other service
4. The app is structured to log analytics via `firebase_analytics` which can we easily replaced with any other service
5. Light and dark theme setup  
6. Dependencies
   - Dependency injection: [get_it](https://pub.dev/packages/get_it)
   - State managment: [mobx](https://pub.dev/packages/mobx), [flutter_mobx](https://pub.dev/packages/flutter_mobx)
   - Network calls: [retrofit](https://pub.dev/packages/retrofit), [dio](https://pub.dev/packages/dio)
   - Routing: [auto_route](https://pub.dev/packages/auto_route)
   - JsonSerializable: [json_serializable](https://pub.dev/packages/json_serializable)
   - Data models: [freezed](https://pub.dev/packages/freezed)
   - Local Storage: [shared_preferences](https://pub.dev/packages/shared_preferences)
   - Error reporting: [firebase_crashlytics](https://firebase.google.com/docs/crashlytics/get-started?platform=flutter)
   - Analytics: [firebase_analytics](https://firebase.google.com/docs/analytics/get-started?platform=flutter)
  
## Flutter pub get all layers
```sh
pub_get_all.sh
```
## Code generation
1. Build mode
   ```sh
   ./bin/generator.sh
   ```
2. Watch mode
   ```sh
   ./bin/generator.sh --watch
   ```

## Extra
1. To check firebase analytic logs
   ```sh
   ./bin/log-analytics.sh
   ```
