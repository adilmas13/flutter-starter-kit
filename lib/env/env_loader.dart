import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvLoader {
  static Future<void> production() => dotenv.load(fileName: ".env.production");

  static Future<void> development() =>
      dotenv.load(fileName: ".env.development");
}
