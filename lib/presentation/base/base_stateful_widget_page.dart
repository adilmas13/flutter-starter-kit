import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter_kit/presentation/base/base_page_store.dart';

abstract class BaseStatefulWidgetPage<T extends BasePageStore>
    extends StatefulWidget {
  const BaseStatefulWidgetPage({super.key});

  @override
  BasePageState<T> createState();
}

abstract class BasePageState<T extends BasePageStore>
    extends State<BaseStatefulWidgetPage<T>> {
  late T store;

  T createStore();

  Widget builder(BuildContext context, T store);

  @override
  void initState() {
    super.initState();
    store = createStore();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => builder(context, store),
    );
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
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
}
