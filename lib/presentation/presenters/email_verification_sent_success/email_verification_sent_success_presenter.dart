import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';
import 'package:mobx/mobx.dart';

part 'email_verification_sent_success_presenter.g.dart';

class EmailVerificationSentSuccessPresenter
    extends _EmailVerificationSentSuccessPresenterBase
    with _$EmailVerificationSentSuccessPresenter {}

abstract class _EmailVerificationSentSuccessPresenterBase
    with Store, NavigationPresenterManager
    implements IEmailVerificationSentSuccessPresenter {
  @override
  void navigateToSignIn() {
    navigateTo = '/sign-in';
  }

  @override
  void dispose() {
    disposeNavigationPresenterManager();
  }
}
