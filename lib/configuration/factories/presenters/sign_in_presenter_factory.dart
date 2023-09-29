import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

ISignInPagePresenter signInPagePresenterFactory() => SignInPagePresenter(
      remoteSignIn: remoteSignInEmailPasswordUseCaseFactory(),
      validation: signInValidationsFactory(),
    );
