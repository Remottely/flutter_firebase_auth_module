// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmailVerificationPresenter on _EmailVerificationPresenterBase, Store {
  final _$uiErrorAtom = Atom(name: '_EmailVerificationPresenterBase.uiError');

  @override
  UIErrorType? get uiError {
    _$uiErrorAtom.reportRead();
    return super.uiError;
  }

  @override
  set uiError(UIErrorType? value) {
    _$uiErrorAtom.reportWrite(value, super.uiError, () {
      super.uiError = value;
    });
  }

  final _$isSendingAtom =
      Atom(name: '_EmailVerificationPresenterBase.isSending');

  @override
  bool get isSending {
    _$isSendingAtom.reportRead();
    return super.isSending;
  }

  @override
  set isSending(bool value) {
    _$isSendingAtom.reportWrite(value, super.isSending, () {
      super.isSending = value;
    });
  }

  final _$signOutAfterSendEmailVerificationAsyncAction = AsyncAction(
      '_EmailVerificationPresenterBase.signOutAfterSendEmailVerification');

  @override
  Future<void> signOutAfterSendEmailVerification() {
    return _$signOutAfterSendEmailVerificationAsyncAction
        .run(() => super.signOutAfterSendEmailVerification());
  }

  final _$sendEmailVerificationAsyncAction =
      AsyncAction('_EmailVerificationPresenterBase.sendEmailVerification');

  @override
  Future<void> sendEmailVerification() {
    return _$sendEmailVerificationAsyncAction
        .run(() => super.sendEmailVerification());
  }

  @override
  String toString() {
    return '''
uiError: ${uiError},
isSending: ${isSending}
    ''';
  }
}
