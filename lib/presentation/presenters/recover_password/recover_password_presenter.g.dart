// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_password_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoverPasswordPresenter on _RecoverPasswordPresenterBase, Store {
  final _$mainErrorAtom = Atom(name: '_RecoverPasswordPresenterBase.uiError');

  @override
  UIErrorType? get uiError {
    _$mainErrorAtom.reportRead();
    return super.uiError;
  }

  @override
  set uiError(UIErrorType? value) {
    _$mainErrorAtom.reportWrite(value, super.uiError, () {
      super.uiError = value;
    });
  }

  final _$isFormValidAtom =
      Atom(name: '_RecoverPasswordPresenterBase.isFormValid');

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

  final _$isSendingAtom = Atom(name: '_RecoverPasswordPresenterBase.isSending');

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

  final _$emailErrorAtom =
      Atom(name: '_RecoverPasswordPresenterBase.emailError');

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

  final _$sendRecoverPasswordEmailAsyncAction =
      AsyncAction('_RecoverPasswordPresenterBase.sendRecoverPasswordEmail');

  @override
  Future<void> sendRecoverPasswordEmail() {
    return _$sendRecoverPasswordEmailAsyncAction
        .run(() => super.sendRecoverPasswordEmail());
  }

  final _$_RecoverPasswordPresenterBaseActionController =
      ActionController(name: '_RecoverPasswordPresenterBase');

  @override
  void validateEmail(String email) {
    final _$actionInfo = _$_RecoverPasswordPresenterBaseActionController
        .startAction(name: '_RecoverPasswordPresenterBase.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_RecoverPasswordPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
uiError: ${uiError},
isFormValid: ${isFormValid},
isSending: ${isSending},
emailError: ${emailError}
    ''';
  }
}
