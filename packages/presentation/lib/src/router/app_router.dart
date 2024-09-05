import 'package:auto_route/auto_route.dart';
import 'package:presentation/src/pages/home/home_page.dart';
import 'package:presentation/src/pages/login//login_page.dart';
import 'package:presentation/src/pages/privacy_policy/privacy_policy_page.dart';
import 'package:presentation/src/pages/profile/profile_page.dart';
import 'package:presentation/src/pages/sign_up/signup_page.dart';
import 'package:presentation/src/pages/splash/splash_page.dart';
import 'package:presentation/src/pages/terms_and_conditions/terms_and_conditions_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: "/", page: SplashRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: TermsAndConditionsRoute.page),
        AutoRoute(page: PrivacyPolicyRoute.page),
      ];
}
