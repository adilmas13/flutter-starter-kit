import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';
import 'package:domain/domain.dart';

part 'base_page_store.g.dart';

class BasePageStore extends _BasePageStore {}

abstract class _BasePageStore with Store {
  Function? _unauthorizedCallback;

  initState() {}

  dispose() {}

  onUnauthorized(Function fn) {
    _unauthorizedCallback = fn;
  }

  @action
  _notifyUnauthorized() {
    _unauthorizedCallback?.call();
  }

  Future<Result<T, E>> executeCall<T extends Object, E extends BaseError>(
      Future<Result<T, E>> Function() fn) async {
    try {
      final result = await fn();
      result.onFailure((failure) {
        if (failure is UnauthorisedError) {
          _notifyUnauthorized();
        }
      });
      return result;
    } catch (e) {
      final error = UnknownError(e.toString()) as E;
      return Result.failure(error);
    }
  }
}
