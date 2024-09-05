import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/base/base_stateful_page_widget.dart';
import 'package:presentation/src/components/aapp_bar.dart';
import 'package:presentation/src/components/web_view.dart';
import 'package:presentation/src/no_op_store.dart';

@RoutePage()
class PrivacyPolicyPage extends BaseStatefulPageWidget<NoOpStore> {
  const PrivacyPolicyPage({super.key}) : super(pageName: "Privacy policy");

  @override
  BasePageState<NoOpStore> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends BasePageState<NoOpStore> {
  @override
  Widget buildBody(BuildContext context, NoOpStore store) {
    return const WebView(
      url: "https://example.com/privacy-policy",
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, NoOpStore store) =>
      AAppBar.onlyTitleAppBar(title: "Privacy policy");

  @override
  NoOpStore createStore() => NoOpStore();
}
