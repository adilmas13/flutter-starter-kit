import 'package:domain/domain.dart';
import 'package:mobx/mobx.dart';
import 'package:presentation/src/base/base_page_store.dart';
import 'package:presentation/src/pages/sign_up/events/signup_event.dart';

// Include generated file
part 'signup_page_store.g.dart';

class SignUpPageStore extends _SignUpPageStore with _$SignUpPageStore {
  SignUpPageStore({
    required super.authRepository,
    required super.analyticsRepository,
  });
}

abstract class _SignUpPageStore extends BasePageStore with Store {
  final AuthRepository _authRepository;
  final AnalyticsRepository _analyticsRepository;

  @observable
  SignupEvent event = SignupEvent.idle();

  _SignUpPageStore({
    required AuthRepository authRepository,
    required AnalyticsRepository analyticsRepository,
  })  : _authRepository = authRepository,
        _analyticsRepository = analyticsRepository;

  @action
  _handleSignupSuccess(bool _value) async {
    await _analyticsRepository
        .logEvent(SignupSuccessAnalyticsEvent(type: "form"));
    event = SignupEvent.success();
  }

  @action
  _handleSignupFailure(BaseError _value) async {
    await _analyticsRepository
        .logEvent(SignupFailureAnalyticsEvent(type: "form"));
    event = SignupEvent.error("Failed to signup");
  }

  @action
  signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    event = SignupEvent.authorisationInProgress();
    final result = await executeCall(
      () => _authRepository.signup(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      ),
    );
    result
      ..onSuccess(_handleSignupSuccess)
      ..onFailure(_handleSignupFailure);
  }
}
