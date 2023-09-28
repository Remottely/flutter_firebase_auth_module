import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';
import 'package:mobx/mobx.dart';

part 'email_verification_presenter.g.dart';

class EmailVerificationPresenter extends _EmailVerificationPresenterBase
    with _$EmailVerificationPresenter {
  EmailVerificationPresenter({
    required ISendEmailVerificationUseCase remoteEmailVerification,
    required ISignOutUseCase remoteSignOut,
  }) {
    super.remoteSendEmailVerification = remoteEmailVerification;
    super.remoteSignOut = remoteSignOut;
  }
}

abstract class _EmailVerificationPresenterBase
    with Store, AppManager, NavigationPresenterManager
    implements IEmailVerificationPresenter {
  @override
  late final ISendEmailVerificationUseCase remoteSendEmailVerification;
  @override
  late final ISignOutUseCase remoteSignOut;

  @override
  @observable
  bool isSending = false;

  @override
  @action
  Future<void> signOutAfterSendEmailVerification() async {
    try {
      uiError = null;
      isSending = true;
      await remoteSignOut.signOut();
      navigateTo = '/email-verification/sent-success';
    } catch (_) {
      uiError = UIErrorType.unexpected;
    } finally {
      isSending = false;
    }
  }

  @override
  @action
  Future<void> sendEmailVerification() async {
    try {
      uiError = null;
      isSending = true;
      await remoteSendEmailVerification.send();
      await signOutAfterSendEmailVerification();
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
