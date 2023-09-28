import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

abstract class ISignInPresenter {
  Stream<String?> get navigateToStream;
  void dispose();

  late final IValidation validation;
  late final ISignInEmailPasswordUseCase remoteSignIn;

  UIErrorType? get emailError;
  UIErrorType? get passwordError;
  UIErrorType? get uiError;

  bool get isFormValid;
  bool get isSending;

  void validateEmail(String email);
  void validatePassword(String password);
  Future<void> signIn();
  void navigateToRecoverPassword();
  void navigateToSignUp();
}
