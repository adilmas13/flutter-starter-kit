import 'package:data/src/firebase_config/firebase_options_dev.dart'
    as firebase_dev;
import 'package:data/src/firebase_config/firebase_options_prod.dart'
    as firebase_prod;
import 'package:firebase_core/firebase_core.dart';

abstract class AppDataSource {
  Future init();
}

class FirebaseAppDataSource implements AppDataSource {
  final String _env;

  FirebaseAppDataSource({
    required String env,
  }) : _env = env;

  @override
  Future init() => Firebase.initializeApp(
        options: _env == "prod"
            ? firebase_prod.DefaultFirebaseOptions.currentPlatform
            : firebase_dev.DefaultFirebaseOptions.currentPlatform,
      );
}
