import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/base/base_stateful_page_widget.dart';
import 'package:presentation/src/extensions/app_router_extension.dart';
import 'package:presentation/src/pages/home/home_page_store.dart';
import 'package:presentation/src/router/app_router.dart';

@RoutePage()
class HomePage extends BaseStatefulPageWidget<HomePageStore> {
  const HomePage({super.key}) : super(pageName: "Home");

  @override
  BasePageState<HomePageStore> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePageStore> {


  @override
  HomePageStore createStore() => HomePageStore();

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, HomePageStore store) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      leading: IconButton(
        icon: const Icon(Icons.person),
        tooltip: "Profile",
        onPressed: () => context.goTo(const ProfileRoute()),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, HomePageStore store) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }
}
