import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

ISignInPresenter signInPresenterFactory() => SignInPresenter(
      remoteSignIn: remoteSignInEmailPasswordUseCaseFactory(),
      validation: signInValidationsFactory(),
    );
