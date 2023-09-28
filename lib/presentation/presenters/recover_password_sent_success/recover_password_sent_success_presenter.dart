import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';
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
