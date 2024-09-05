import 'package:data/data.dart';
import 'package:di/src/di_config_options.dart';
import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/presentation.dart';

final di = GetIt.instance;

void initDependencies({required DiConfigOptions options}) {
  _setupNetwork(apiUrl: options.apiUrl);
  _setupDataSource(env: options.env);
  _setupRepository();
  _setupStore();
}

void _setupStore() {
  di.registerLazySingleton<AppStore>(
    () => AppStore(
      themeRepository: di.get<ThemeRepository>(),
    ),
  );
  di.registerLazySingleton<UserStore>(
    () => UserStore(
      tokenRepository: di.get<TokenRepository>(),
    ),
  );
}

void _setupDataSource({required String env}) {
  di.registerLazySingleton<ErrorReportingDataSource>(
    () => FirebaseErrorReportingDataSource(),
  );
  di.registerLazySingleton<AppDataSource>(
    () => FirebaseAppDataSource(env: env),
  );
  di.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      restClient: di.get<RestClient>(),
    ),
  );
  di.registerLazySingleton<TokenDataSource>(
    () => LocalTokenDataSource(),
  );
  di.registerLazySingleton<AnalyticsDataSource>(
    () => FirebaseAnalyticsDataSource(),
  );
  di.registerLazySingleton<ThemeDataSource>(
    () => LocalThemeDataSource(),
  );
}

void _setupRepository() {
  di.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      appDataSource: di.get<AppDataSource>(),
    ),
  );
  di.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(
      themeDataSource: di.get<ThemeDataSource>(),
      errorReportingDataSource: di.get<ErrorReportingDataSource>(),
    ),
  );
  di.registerLazySingleton<ErrorReportingRepository>(
    () => ErrorReportingRepositoryImpl(
      dataSource: di.get<ErrorReportingDataSource>(),
    ),
  );
  di.registerLazySingleton<AnalyticsRepository>(
    () => AnalyticsRepositoryImpl(
      dataSource: di.get<AnalyticsDataSource>(),
    ),
  );
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: di.get<AuthDataSource>(),
      tokenDataSource: di.get<TokenDataSource>(),
      errorReportingDataSource: di.get<ErrorReportingDataSource>(),
    ),
  );
  di.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      errorReportingDataSource: di.get<ErrorReportingDataSource>(),
      tokenDataSource: di.get<TokenDataSource>(),
    ),
  );
  di.registerLazySingleton<TokenRepository>(
    () => TokenRepositoryImpl(
      errorReportingDataSource: di.get<ErrorReportingDataSource>(),
      tokenDataSource: di.get<TokenDataSource>(),
    ),
  );
}

void _setupNetwork({required String apiUrl}) {
  di.registerLazySingleton(
    () => buildClient(
      baseUrl: apiUrl,
      tokenDataSource: di.get<TokenDataSource>(),
    ),
  );
  di.registerLazySingleton(
    () => RestClient(
      di.get(),
    ),
  );
}
