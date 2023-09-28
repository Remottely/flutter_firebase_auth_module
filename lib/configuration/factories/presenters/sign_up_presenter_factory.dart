import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

ISignUpPresenter signUpPresenterFactory() => SignUpPresenter(
      validation: signUpValidationsFactory(),
      remoteSignUp: remoteSignUpEmailPasswordUseCaseFactory(),
      remoteEmailVerification: remoteSendEmailVerificationUseCaseFactory(),
    );
