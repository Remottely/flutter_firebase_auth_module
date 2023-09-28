import 'package:intl/intl.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_presenter.g.dart';

class SignUpPresenter extends _SignUpPresenterBase with _$SignUpPresenter {
  SignUpPresenter(
      {required IValidation validation,
      required ISignUpEmailPasswordUseCase remoteSignUp,
      required ISendEmailVerificationUseCase remoteEmailVerification}) {
    super.validation = validation;
    super.remoteSignUp = remoteSignUp;
    super.remoteSendEmailVerification = remoteEmailVerification;
  }
}

abstract class _SignUpPresenterBase
    with Store, AppManager, NavigationPresenterManager
    implements ISignUpPresenter {
  @override
  late final IValidation validation;
  @override
  late final ISignUpEmailPasswordUseCase remoteSignUp;
  @override
  late final ISendEmailVerificationUseCase remoteSendEmailVerification;

  String? _fullName;
  String? _email;
  String? _password;
  String? _passwordConfirmation;

  @override
  @observable
  DateTime birthdayDateTime = DateTime(2000, 01, 01);

  @override
  @observable
  bool isSending = false;

  @override
  @observable
  String? birthday;

  @override
  @observable
  UIErrorType? fullNameError;

  @override
  @observable
  UIErrorType? emailError;

  @override
  @observable
  UIErrorType? birthdayError;

  @override
  @observable
  UIErrorType? passwordError;

  @override
  @observable
  UIErrorType? passwordConfirmationError;

  @action
  UIErrorType? _validateField(String field) {
    final formData = {
      'fullName': _fullName,
      'email': _email,
      'birthday': birthday,
      'password': _password,
      'passwordConfirmation': _passwordConfirmation
    };

    final error = validation.validate(field: field, input: formData);

    if (error != null) {
      return error.uiError;
    }

    return null;
  }

  @observable
  @override
  bool isFormValid = false;

  void _validateForm() {
    isFormValid = fullNameError == null &&
        emailError == null &&
        passwordError == null &&
        passwordConfirmationError == null &&
        birthdayError == null &&
        _fullName != null &&
        _email != null &&
        birthday != null &&
        _password != null &&
        _passwordConfirmation != null &&
        _password == _passwordConfirmation;
  }

  @override
  @action
  void validateFullName(String fullName) {
    _fullName = fullName;
    fullNameError = _validateField('fullName');
    _validateForm();
  }

  @override
  @action
  void validateEmail(String email) {
    _email = email;
    emailError = _validateField('email');
    _validateForm();
  }

  @override
  @action
  void validateBirthday(DateTime birthday) {
    birthdayDateTime = birthday;
    final String dateFormated = DateFormat('dd/MM/yyyy').format(birthday);
    this.birthday = dateFormated == '01/01/2000' ? null : dateFormated;
    if (this.birthday != null) {
      birthdayError = _validateField('birthday');
    }
    _validateForm();
  }

  @override
  @action
  void validatePassword(String password) {
    _password = password;
    passwordError = _validateField('password');
    _validateForm();
  }

  @override
  @action
  void validatePasswordConfirmation(String passwordConfirmation) {
    _passwordConfirmation = passwordConfirmation;
    passwordConfirmationError = _validateField('passwordConfirmation');
    _validateForm();
  }

  @override
  @action
  Future<void> signUp() async {
    try {
      uiError = null;
      isSending = true;
      await remoteSignUp.signUp(
        // TODO REMOVE THE FINAL?
        // TODO SAVE LOCALLY  ENTITY IN A SINGLETON INSTANCE
        SignUpParams(
          fullName: _fullName ?? '',
          email: _email ?? '',
          birthday: birthday ?? '00/00/2000',
          password: _password ?? '',
          passwordConfirmation: _passwordConfirmation ?? '',
        ),
      );
      // if (resource.hasError) {
      //   uiError = UIErrorType.emailInUse; // TODO EXTENSION
      // } else {
      sendEmailVerification();
      // navigation.toSplash();
      navigateTo = '/';
      // }
    } catch (error) {
      // uiError = UIErrorType.invalidCredentials;
      uiError = UIErrorType.unexpected;
    } finally {
      isSending = false;
    }
  }

  // @override
  // @action
  // Future<void> signOutAfterSendEmailVerification() async {
  //   try {
  //     uiError = null;
  //     isSending = true;
  //     final resourceRemoteSignOut = await remoteSignOut.call();
  //     navigation.pushReplacementNamedEmailVerificationSentSuccess();
  //   } catch (_) {
  //     uiError = UIErrorType.unexpected;
  //   } finally {
  //     isSending = false;
  //   }
  // }
  @override
  @action
  Future<void> sendEmailVerification() async {
    try {
      uiError = null;
      isSending = true;
      await remoteSendEmailVerification.send();
    } catch (_) {
      uiError = UIErrorType.invalidCredentials;
    } finally {
      isSending = false;
    }
  }

  @override
  void navigateToSignIn() {
    navigateTo = '/sign-in';
  }

  @override
  void dispose() {
    disposeNavigationPresenterManager();
  }
}
