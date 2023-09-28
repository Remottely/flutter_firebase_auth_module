import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

mixin IRecoverPasswordPresenter {
  Stream<String?> get navigateToStream;
  void dispose();

  late final IValidation validation;
  late final ISendRecoverPasswordUseCase remoteRecoverPassword;

  UIErrorType? get emailError;
  UIErrorType? get uiError;

  bool get isFormValid;
  bool get isSending;

  void validateEmail(String email);
  Future<void> sendRecoverPasswordEmail();
  void navigateToSignIn();
}
