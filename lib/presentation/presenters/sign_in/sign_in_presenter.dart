import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_presenter.g.dart';

class SignInPresenter extends _SignInPresenterBase with _$SignInPresenter {
  SignInPresenter(
      {required IValidation validation,
      required ISignInEmailPasswordUseCase remoteSignIn}) {
    super.validation = validation;
    super.remoteSignIn = remoteSignIn;
  }
}

abstract class _SignInPresenterBase
    with Store, AppManager, NavigationPresenterManager
    implements ISignInPresenter {
  @override
  late final IValidation validation;
  @override
  late final ISignInEmailPasswordUseCase remoteSignIn;

  @override
  @observable
  bool isFormValid = false;

  @override
  @observable
  bool isSending = false;

  String? _email;

  String? _password;

  @override
  @observable
  UIErrorType? emailError;

  @override
  @observable
  UIErrorType? passwordError;

  UIErrorType? _validateField(String field) {
    final formData = {
      'email': _email,
      'password': _password,
    };
    final error = validation.validate(field: field, input: formData);

    if (error != null) {
      return error.uiError;
    }

    return null;
  }

  void validateForm() {
    isFormValid = emailError == null &&
        passwordError == null &&
        _email != null &&
        _password != null;
  }

  @override
  @action
  void validateEmail(String email) {
    _email = email;
    emailError = _validateField('email');
    validateForm();
  }

  @override
  @action
  void validatePassword(String password) {
    _password = password;
    passwordError = _validateField('password');
    validateForm();
  }

  @override
  @action
  Future<void> signIn() async {
    try {
      uiError = null;
      isSending = true;
      await remoteSignIn.signIn(
        // TODO PUT IT IN A SINGLETON
        SignInParams(
          email: _email!,
          password: _password!,
        ),
      );
      // navigation.toSplash();
      navigateTo = '/';
    } catch (_) {
      uiError =
          UIErrorType.unexpected; // TODO GET THE ERROR BASED ON DomainErrorType
    } finally {
      isSending = false;
    }
  }

  @override
  void navigateToRecoverPassword() {
    navigateTo = '/recover-password';
  }

  @override
  void navigateToSignUp() {
    navigateTo = '/sign-up';
  }

  @override
  void dispose() {
    disposeNavigationPresenterManager();
  }
}
