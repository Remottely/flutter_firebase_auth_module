import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';
import 'package:mobx/mobx.dart';

part 'recover_password_presenter.g.dart';

class RecoverPasswordPresenter extends _RecoverPasswordPresenterBase
    with _$RecoverPasswordPresenter {
  RecoverPasswordPresenter(
      {required IValidation validation,
      required ISendRecoverPasswordUseCase remoteRecoverPassword}) {
    super.validation = validation;
    super.remoteRecoverPassword = remoteRecoverPassword;
  }
}

abstract class _RecoverPasswordPresenterBase
    with Store, AppManager, NavigationPresenterManager
    implements IRecoverPasswordPresenter {
  @override
  late final IValidation validation;
  @override
  late final ISendRecoverPasswordUseCase remoteRecoverPassword;

  @observable
  @override
  bool isFormValid = false;

  @override
  @observable
  bool isSending = false;

  String? _email;

  @override
  @observable
  UIErrorType? emailError;

  UIErrorType? _validateField(String field) {
    final formData = {
      'email': _email,
    };
    final error = validation.validate(field: field, input: formData);

    if (error != null) {
      return error.uiError;
    }

    return null;
  }

  void _validateForm() {
    isFormValid = emailError == null && _email != null;
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
  Future<void> sendRecoverPasswordEmail() async {
    try {
      uiError = null;
      isSending = true;
      await remoteRecoverPassword.send(
        params: SendRecoverPasswordParams(email: _email!),
      );
      // navigation.toRecoverPasswordSentSuccess();
      navigateTo = '/recover-password/sent-success';
    } catch (error) {
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
