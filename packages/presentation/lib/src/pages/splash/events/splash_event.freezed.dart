// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? authorised,
    TResult? Function()? unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unauthorised value) unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Authorised value)? authorised,
    TResult? Function(Unauthorised value)? unauthorised,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unauthorised value)? unauthorised,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
          SplashEvent value, $Res Function(SplashEvent) then) =
      _$SplashEventCopyWithImpl<$Res, SplashEvent>;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res, $Val extends SplashEvent>
    implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PendingImplCopyWith<$Res> {
  factory _$$PendingImplCopyWith(
          _$PendingImpl value, $Res Function(_$PendingImpl) then) =
      __$$PendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PendingImplCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$PendingImpl>
    implements _$$PendingImplCopyWith<$Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl _value, $Res Function(_$PendingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PendingImpl implements Pending {
  _$PendingImpl();

  @override
  String toString() {
    return 'SplashEvent.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PendingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? authorised,
    TResult? Function()? unauthorised,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unauthorised value) unauthorised,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Authorised value)? authorised,
    TResult? Function(Unauthorised value)? unauthorised,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unauthorised value)? unauthorised,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class Pending implements SplashEvent {
  factory Pending() = _$PendingImpl;
}

/// @nodoc
abstract class _$$AuthorisedImplCopyWith<$Res> {
  factory _$$AuthorisedImplCopyWith(
          _$AuthorisedImpl value, $Res Function(_$AuthorisedImpl) then) =
      __$$AuthorisedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorisedImplCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$AuthorisedImpl>
    implements _$$AuthorisedImplCopyWith<$Res> {
  __$$AuthorisedImplCopyWithImpl(
      _$AuthorisedImpl _value, $Res Function(_$AuthorisedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AuthorisedImpl implements Authorised {
  _$AuthorisedImpl();

  @override
  String toString() {
    return 'SplashEvent.authorised()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthorisedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) {
    return authorised();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? authorised,
    TResult? Function()? unauthorised,
  }) {
    return authorised?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) {
    if (authorised != null) {
      return authorised();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unauthorised value) unauthorised,
  }) {
    return authorised(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Authorised value)? authorised,
    TResult? Function(Unauthorised value)? unauthorised,
  }) {
    return authorised?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unauthorised value)? unauthorised,
    required TResult orElse(),
  }) {
    if (authorised != null) {
      return authorised(this);
    }
    return orElse();
  }
}

abstract class Authorised implements SplashEvent {
  factory Authorised() = _$AuthorisedImpl;
}

/// @nodoc
abstract class _$$UnauthorisedImplCopyWith<$Res> {
  factory _$$UnauthorisedImplCopyWith(
          _$UnauthorisedImpl value, $Res Function(_$UnauthorisedImpl) then) =
      __$$UnauthorisedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorisedImplCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$UnauthorisedImpl>
    implements _$$UnauthorisedImplCopyWith<$Res> {
  __$$UnauthorisedImplCopyWithImpl(
      _$UnauthorisedImpl _value, $Res Function(_$UnauthorisedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorisedImpl implements Unauthorised {
  _$UnauthorisedImpl();

  @override
  String toString() {
    return 'SplashEvent.unauthorised()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnauthorisedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() authorised,
    required TResult Function() unauthorised,
  }) {
    return unauthorised();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? authorised,
    TResult? Function()? unauthorised,
  }) {
    return unauthorised?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? authorised,
    TResult Function()? unauthorised,
    required TResult orElse(),
  }) {
    if (unauthorised != null) {
      return unauthorised();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Authorised value) authorised,
    required TResult Function(Unauthorised value) unauthorised,
  }) {
    return unauthorised(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Authorised value)? authorised,
    TResult? Function(Unauthorised value)? unauthorised,
  }) {
    return unauthorised?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Authorised value)? authorised,
    TResult Function(Unauthorised value)? unauthorised,
    required TResult orElse(),
  }) {
    if (unauthorised != null) {
      return unauthorised(this);
    }
    return orElse();
  }
}

abstract class Unauthorised implements SplashEvent {
  factory Unauthorised() = _$UnauthorisedImpl;
}
