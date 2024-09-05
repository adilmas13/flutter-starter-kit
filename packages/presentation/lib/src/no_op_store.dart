import 'package:mobx/mobx.dart';
import 'package:presentation/src/base/base_page_store.dart';

part 'no_op_store.g.dart';

class NoOpStore extends _NoOpStore with _$NoOpStore {
  NoOpStore();
}

abstract class _NoOpStore extends BasePageStore with Store {}
