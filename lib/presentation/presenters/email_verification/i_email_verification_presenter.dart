import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

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
