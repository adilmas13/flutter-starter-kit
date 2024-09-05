import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:presentation/src/base/base_page_store.dart';
import 'package:presentation/src/extensions/app_router_extension.dart';
import 'package:presentation/src/router/app_router.dart';
import 'package:presentation/src/user_store.dart';

abstract class BaseStatefulPageWidget<T extends BasePageStore>
    extends StatefulWidget {
  final String pageName;

  const BaseStatefulPageWidget({super.key, required this.pageName});

  @override
  BasePageState<T> createState();
}

abstract class BasePageState<T extends BasePageStore>
    extends State<BaseStatefulPageWidget<T>> {
  late T store;

  final disposers = <ReactionDisposer>[];

  T createStore();

  final AnalyticsRepository _analyticsRepository =
      di.get<AnalyticsRepository>();

  Widget buildBody(BuildContext context, T store);

  PreferredSizeWidget? buildAppBar(BuildContext context, T store) => null;

  @override
  void initState() {
    super.initState();
    _analyticsRepository.logScreenView(widget.pageName);
    store = createStore()
      ..onUnauthorized(_showAuthorizedDialog)
      ..initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(context, store),
          body: SafeArea(
            child: buildBody(context, store),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (var disposer in disposers) {
      disposer();
    }
    store.dispose();
    _analyticsRepository.logExitScreenView(widget.pageName);
  }

  @override
  void setState(VoidCallback fn) {
    safely(() {
      super.setState(fn);
    });
  }

  // Use this to when performing operations that need context
  void safely(VoidCallback body) {
    if (mounted && context.mounted) {
      body();
    }
  }

  _showAuthorizedDialog() {
    safely(
      () {
        final theme = Theme.of(context).elevatedButtonTheme;
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) {
            return PopScope(
              canPop: false,
              child: AlertDialog(
                title: const Text("Session Expired"),
                content: const Text(
                  "Your session has expired. Please log in again to continue.",
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  ElevatedButton(
                    style: theme.style,
                    onPressed: () {
                      di.get<UserStore>().logout();
                      context.replaceRouteStack([const LoginRoute()]);
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
