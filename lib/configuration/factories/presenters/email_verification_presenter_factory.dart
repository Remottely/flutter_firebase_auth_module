import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

IEmailVerificationPresenter emailVerificationPresenterFactory() =>
    EmailVerificationPresenter(
      remoteEmailVerification: remoteSendEmailVerificationUseCaseFactory(),
      remoteSignOut: remoteSignOutUseCaseFactory(),
    );
