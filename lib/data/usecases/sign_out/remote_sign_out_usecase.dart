import 'dart:developer';

import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class RemoteSignOutUseCase implements ISignOutUseCase {
  final IFirebaseAuthClient auth;

  RemoteSignOutUseCase({required this.auth});

  @override
  Future<void> signOut() async {
    try {
      final User? user = auth.currentUser;
      if (user != null) {
        await auth.signOut();

        log('[SIGNOUT_SUCCESS | RemoteSignOutUseCase] to ${user.email}');
        return;
      } else {
        log('[SIGNOUT_USER_NOT_LOGGED_IN_ERROR]');
        throw DomainErrorType.userNotLoggedIn;
      }
    } catch (error) {
      log('[SIGNOUT_ERROR]:' + error.toString());
      throw DomainErrorType.unexpected;
    }
  }
}
