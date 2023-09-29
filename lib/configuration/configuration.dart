import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

export 'factories/presenters/presenters.dart';
export 'factories/usecases/usecases.dart';
export 'factories/validations/validations.dart';
export 'factories/views/views.dart';

// extension SignInPageExtension on SignInPage {
//   String get route => ;
//   String get route => '/sign-in';
// }

// class FirebaseAuthModulePages {}

// class FirebaseAuthModuleRoutes {
//   String get signInRoute => signInPageFactory().currentPath;
// }

class FirebaseAuthModule {
  final ISignInPagePresenter signInPagePresenter;
  SignInPage get signInPage => SignInPage(signInPagePresenter);

  // FirebaseAuthModuleRoutes get routes => FirebaseAuthModuleRoutes();
  // FirebaseAuthModulePages get pages => FirebaseAuthModulePages();

  FirebaseAuthModule({required this.signInPagePresenter});
}

final authModule =
    FirebaseAuthModule(signInPagePresenter: signInPagePresenterFactory());

class EvenirePaths {
  /// Initial
  static const String initialAbsolutPath = '';

  /// Start
  static const String signedOutCurrentPath = '/signed-out';
  static const String signedOutAbsolutPath =
      initialAbsolutPath + signedOutCurrentPath;
  static const String signedInCurrentPath = '/signed-in';
  static const String signedInAbsolutPath =
      initialAbsolutPath + signedInCurrentPath;

  /// Authentication
  static const String authCurrentPath = '/auth';
  static const String authAbsolutPath = signedOutAbsolutPath + authCurrentPath;
  static const String signInCurrentPath = '/sign-in';
  static const String signInAbsolutPath = authAbsolutPath + signInCurrentPath;
  static const String signUpCurrentPath = '/sign-up';
  static const String signUpAbsolutPath = authAbsolutPath + signUpCurrentPath;
  static const String recoverPasswordCurrentPath = '/recover-password';
  static const String recoverPasswordAbsolutPath =
      authAbsolutPath + recoverPasswordCurrentPath;
  static const String recoverPasswordSuccessCurrentPath =
      '/recover-password/sent-success';
  static const String recoverPasswordSuccessAbsolutPath =
      authAbsolutPath + recoverPasswordSuccessCurrentPath;
  static const String emailVerificationCurrentPath = '/email-verification';
  static const String emailVerificationAbsolutPath =
      authAbsolutPath + emailVerificationCurrentPath;

  /// Chats
  static const String chatsCurrentPath = '/chats';
  static const String chatsAbsolutPath = signedInAbsolutPath + chatsCurrentPath;

  /// Profile
  static const String profileCurrentPath = '/profile';
  static const String profileAbsolutPath =
      signedInAbsolutPath + profileCurrentPath;

  /// Find
  static const String findCurrentPath = '/find';
  static const String findAbsolutPath = signedInAbsolutPath + findCurrentPath;

  /// Persons
  static const String personCurrentPath = '/person';
  static const String personAbsolutPath = findAbsolutPath + personCurrentPath;
  static const String personDetailsCurrentPath = '/details';
  static const String personDetailsAbsolutPath =
      personAbsolutPath + personDetailsCurrentPath;
  static const String personMatchCurrentPath = '/match';
  static const String personMatchAbsolutPath =
      personAbsolutPath + personMatchCurrentPath;

  /// Events
  static const String eventCurrentPath = '/event';
  static const String eventAbsolutPath = findAbsolutPath + eventCurrentPath;
  static const String eventDetailsCurrentPath = '/details';
  static const String eventDetailsAbsolutPath =
      eventAbsolutPath + eventDetailsCurrentPath;
  static const String eventMatchCurrentPath = '/match';
  static const String eventMatchAbsolutPath =
      eventAbsolutPath + eventMatchCurrentPath;
}
