import 'package:auto_route/annotations.dart';
import 'package:flutter/widgets.dart';
import 'package:presentation/src/base/base_stateful_page_widget.dart';
import 'package:presentation/src/components/aapp_bar.dart';
import 'package:presentation/src/components/web_view.dart';
import 'package:presentation/src/no_op_store.dart';

@RoutePage()
class TermsAndConditionsPage extends BaseStatefulPageWidget<NoOpStore> {
  const TermsAndConditionsPage({super.key})
      : super(pageName: "Terms and conditions");

  @override
  BasePageState<NoOpStore> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends BasePageState<NoOpStore> {
  @override
  Widget buildBody(BuildContext context, NoOpStore store) {
    return const WebView(
      url: "https://example.com/terms-of-services",
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, NoOpStore store) =>
      AAppBar.onlyTitleAppBar(title: "Terms and conditions");

  @override
  NoOpStore createStore() => NoOpStore();
}
