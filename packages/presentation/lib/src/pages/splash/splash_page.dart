import 'package:auto_route/annotations.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:presentation/src/base/base_stateful_page_widget.dart';
import 'package:presentation/src/components/space.dart';
import 'package:presentation/src/extensions/app_router_extension.dart';
import 'package:presentation/src/pages/splash/splash_page_store.dart';
import 'package:presentation/src/router/app_router.dart';

@RoutePage()
class SplashPage extends BaseStatefulPageWidget<SplashPageStore> {
  const SplashPage({super.key}) : super(pageName: "Splash");

  @override
  BasePageState<SplashPageStore> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<SplashPageStore> {
  @override
  void initState() {
    super.initState();
    disposers.add(reaction((_) => store.event, (event) {
      event.maybeWhen(
        authorised: () => context.goToAndReplace(const HomeRoute()),
        unauthorised: () => context.goToAndReplace(const LoginRoute()),
        orElse: () => {},
      );
    }));
  }

  @override
  Widget buildBody(BuildContext context, SplashPageStore store) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Space(y: 20),
          Text(
            "Flutter starter kit\nSplash Screen",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  @override
  SplashPageStore createStore() => SplashPageStore(
        userRepository: di.get<UserRepository>(),
      );
}
