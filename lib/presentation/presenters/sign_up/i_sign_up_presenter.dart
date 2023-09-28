import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

abstract class ISignUpPresenter {
  Stream<String?> get navigateToStream;
  void dispose();

  late final IValidation validation;
  late final ISignUpEmailPasswordUseCase remoteSignUp;
  late final ISendEmailVerificationUseCase remoteSendEmailVerification;

  DateTime get birthdayDateTime;
  String? get birthday;

  UIErrorType? get uiError;
  UIErrorType? get fullNameError;
  UIErrorType? get emailError;
  UIErrorType? get birthdayError;
  UIErrorType? get passwordError;
  UIErrorType? get passwordConfirmationError;

  bool get isFormValid;
  bool get isSending;

  void validateFullName(String fullName);
  void validateEmail(String email);
  void validateBirthday(DateTime birthday);
  void validatePassword(String password);
  void validatePasswordConfirmation(String passwordConfirmation);

  Future<void> signUp();
  Future<void> sendEmailVerification();
  void navigateToSignIn();
}
