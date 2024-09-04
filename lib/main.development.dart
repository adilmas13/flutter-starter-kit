import 'package:flutter_starter_kit/env/env_loader.dart';
import 'package:flutter_starter_kit/main.dart' as main_runner;

void main() async {
  await EnvLoader.development();
  main_runner.main();
}
