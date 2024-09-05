// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpPageStore on _SignUpPageStore, Store {
  late final _$eventAtom =
      Atom(name: '_SignUpPageStore.event', context: context);

  @override
  SignupEvent get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(SignupEvent value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  late final _$_handleSignupSuccessAsyncAction =
      AsyncAction('_SignUpPageStore._handleSignupSuccess', context: context);

  @override
  Future _handleSignupSuccess(bool _value) {
    return _$_handleSignupSuccessAsyncAction
        .run(() => super._handleSignupSuccess(_value));
  }

  late final _$_handleSignupFailureAsyncAction =
      AsyncAction('_SignUpPageStore._handleSignupFailure', context: context);

  @override
  Future _handleSignupFailure(BaseError _value) {
    return _$_handleSignupFailureAsyncAction
        .run(() => super._handleSignupFailure(_value));
  }

  late final _$signupAsyncAction =
      AsyncAction('_SignUpPageStore.signup', context: context);

  @override
  Future signup(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) {
    return _$signupAsyncAction.run(() => super.signup(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName));
  }

  @override
  String toString() {
    return '''
event: ${event}
    ''';
  }
}
