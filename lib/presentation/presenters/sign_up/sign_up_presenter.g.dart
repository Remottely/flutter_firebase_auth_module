// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_presenter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpPresenter on _SignUpPresenterBase, Store {
  final _$birthdayDateTimeAtom =
      Atom(name: '_SignUpPresenterBase.birthdayDateTime');

  @override
  DateTime get birthdayDateTime {
    _$birthdayDateTimeAtom.reportRead();
    return super.birthdayDateTime;
  }

  @override
  set birthdayDateTime(DateTime value) {
    _$birthdayDateTimeAtom.reportWrite(value, super.birthdayDateTime, () {
      super.birthdayDateTime = value;
    });
  }

  final _$isSendingAtom = Atom(name: '_SignUpPresenterBase.isSending');

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

  final _$birthdayAtom = Atom(name: '_SignUpPresenterBase.birthday');

  @override
  String? get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(String? value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  final _$fullNameErrorAtom = Atom(name: '_SignUpPresenterBase.fullNameError');

  @override
  UIErrorType? get fullNameError {
    _$fullNameErrorAtom.reportRead();
    return super.fullNameError;
  }

  @override
  set fullNameError(UIErrorType? value) {
    _$fullNameErrorAtom.reportWrite(value, super.fullNameError, () {
      super.fullNameError = value;
    });
  }

  final _$birthdayErrorAtom = Atom(name: '_SignUpPresenterBase.birthdayError');

  @override
  UIErrorType? get birthdayError {
    _$birthdayErrorAtom.reportRead();
    return super.birthdayError;
  }

  @override
  set birthdayError(UIErrorType? value) {
    _$birthdayErrorAtom.reportWrite(value, super.birthdayError, () {
      super.birthdayError = value;
    });
  }

  final _$emailErrorAtom = Atom(name: '_SignUpPresenterBase.emailError');

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

  final _$passwordErrorAtom = Atom(name: '_SignUpPresenterBase.passwordError');

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

  final _$passwordConfirmationErrorAtom =
      Atom(name: '_SignUpPresenterBase.passwordConfirmationError');

  @override
  UIErrorType? get passwordConfirmationError {
    _$passwordConfirmationErrorAtom.reportRead();
    return super.passwordConfirmationError;
  }

  @override
  set passwordConfirmationError(UIErrorType? value) {
    _$passwordConfirmationErrorAtom
        .reportWrite(value, super.passwordConfirmationError, () {
      super.passwordConfirmationError = value;
    });
  }

  final _$mainErrorAtom = Atom(name: '_SignUpPresenterBase.uiError');

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

  final _$isFormValidAtom = Atom(name: '_SignUpPresenterBase.isFormValid');

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

  final _$signUpAsyncAction = AsyncAction('_SignUpPresenterBase.signUp');

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$_SignUpPresenterBaseActionController =
      ActionController(name: '_SignUpPresenterBase');

  @override
  UIErrorType? _validateField(String field) {
    final _$actionInfo = _$_SignUpPresenterBaseActionController.startAction(
        name: '_SignUpPresenterBase._validateField');
    try {
      return super._validateField(field);
    } finally {
      _$_SignUpPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFullName(String fullName) {
    final _$actionInfo = _$_SignUpPresenterBaseActionController.startAction(
        name: '_SignUpPresenterBase.validateFullName');
    try {
      return super.validateFullName(fullName);
    } finally {
      _$_SignUpPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String email) {
    final _$actionInfo = _$_SignUpPresenterBaseActionController.startAction(
        name: '_SignUpPresenterBase.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_SignUpPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateBirthday(DateTime birthday) {
    final _$actionInfo = _$_SignUpPresenterBaseActionController.startAction(
        name: '_SignUpPresenterBase.validateBirthday');
    try {
      return super.validateBirthday(birthday);
    } finally {
      _$_SignUpPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String password) {
    final _$actionInfo = _$_SignUpPresenterBaseActionController.startAction(
        name: '_SignUpPresenterBase.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$_SignUpPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePasswordConfirmation(String passwordConfirmation) {
    final _$actionInfo = _$_SignUpPresenterBaseActionController.startAction(
        name: '_SignUpPresenterBase.validatePasswordConfirmation');
    try {
      return super.validatePasswordConfirmation(passwordConfirmation);
    } finally {
      _$_SignUpPresenterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
birthdayDateTime: ${birthdayDateTime},
isSending: ${isSending},
birthday: ${birthday},
fullNameError: ${fullNameError},
birthdayError: ${birthdayError},
emailError: ${emailError},
passwordError: ${passwordError},
passwordConfirmationError: ${passwordConfirmationError},
uiError: ${uiError},
isFormValid: ${isFormValid}
    ''';
  }
}
