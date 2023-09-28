// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInPresenter on _SignInPresenterBase, Store {
  final _$uiErrorAtom = Atom(name: '_SignInPresenterBase.uiError');

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

  final _$isFormValidAtom = Atom(name: '_SignInPresenterBase.isFormValid');

  @override
  bool get isFormValid {
    _$isFormValidAtom.reportRead();
    return super.isFormValid;
  }

  @override
  set isFormValid(bool value) {
    _$isFormValidAtom.reportWrite(value, super.isFormValid, () {
      super.isFormValid = value;
    });
  }

  final _$isSendingAtom = Atom(name: '_SignInPresenterBase.isSending');

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

  final _$emailErrorAtom = Atom(name: '_SignInPresenterBase.emailError');

  @override
  UIErrorType? get emailError {
    _$emailErrorAtom.reportRead();
    return super.emailError;
  }

  @override
  set emailError(UIErrorType? value) {
    _$emailErrorAtom.reportWrite(value, super.emailError, () {
      super.emailError = value;
    });
  }

  final _$passwordErrorAtom = Atom(name: '_SignInPresenterBase.passwordError');

  @override
  UIErrorType? get passwordError {
    _$passwordErrorAtom.reportRead();
    return super.passwordError;
  }

  @override
  set passwordError(UIErrorType? value) {
    _$passwordErrorAtom.reportWrite(value, super.passwordError, () {
      super.passwordError = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_SignInPresenterBase.signIn');

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$_SignInPresenterBaseActionController =
      ActionController(name: '_SignInPresenterBase');

  @override
  void validateEmail(String email) {
    final _$actionInfo = _$_SignInPresenterBaseActionController.startAction(
        name: '_SignInPresenterBase.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_SignInPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String password) {
    final _$actionInfo = _$_SignInPresenterBaseActionController.startAction(
        name: '_SignInPresenterBase.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$_SignInPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uiError: ${uiError},
isFormValid: ${isFormValid},
isSending: ${isSending},
emailError: ${emailError},
passwordError: ${passwordError},
    ''';
  }
}
