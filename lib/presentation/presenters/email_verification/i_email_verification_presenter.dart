import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

mixin IEmailVerificationPresenter {
  Stream<String?> get navigateToStream;
  void dispose();

  late final ISendEmailVerificationUseCase remoteSendEmailVerification;
  late final ISignOutUseCase remoteSignOut;

  UIErrorType? get uiError;

  bool get isSending;

  Future<void> sendEmailVerification();
  Future<void> signOutAfterSendEmailVerification();
  void navigateToSignIn();
}
