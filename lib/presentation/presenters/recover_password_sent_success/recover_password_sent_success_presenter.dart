import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';
import 'package:mobx/mobx.dart';

part 'recover_password_sent_success_presenter.g.dart';

class RecoverPasswordSentSuccessPresenter
    extends _RecoverPasswordSentSuccessPresenterBase
    with _$RecoverPasswordSentSuccessPresenter {}

abstract class _RecoverPasswordSentSuccessPresenterBase
    with Store, NavigationPresenterManager
    implements IRecoverPasswordSentSuccessPresenter {
  @override
  void navigateToSignIn() {
    navigateTo = '/sign-in';
  }

  @override
  void dispose() {
    disposeNavigationPresenterManager();
  }
}
