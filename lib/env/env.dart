import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String env = dotenv.get("ENV", fallback: "dev");
  static String apiUrl = dotenv.get("API_URL", fallback: "");
}
