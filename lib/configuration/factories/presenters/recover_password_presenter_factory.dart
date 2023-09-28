import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

IRecoverPasswordPresenter recoverPasswordPresenterFactory() =>
    RecoverPasswordPresenter(
      validation: recoverPasswordValidationsFactory(),
      remoteRecoverPassword: remoteSendRecoverPasswordUseCaseFactory(),
    );
