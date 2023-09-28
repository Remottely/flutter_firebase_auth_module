import 'dart:developer';

import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class RemoteSendEmailVerificationUseCase
    implements ISendEmailVerificationUseCase {
  final IFirebaseAuthClient auth;

  RemoteSendEmailVerificationUseCase({required this.auth});

  @override
  Future<void> send() async {
    try {
      final User? user = auth.currentUser;

      if (user != null) {
        await user.sendEmailVerification();
        log('[SENDIG_DATA_SUCCESS | RemoteSendEmailVerificationUseCase] to ${user.email}');
        return;
      } else {
        log('[SENDIG_DATA_USER_NOT_LOGGED_IN_ERROR]');
        throw DomainErrorType.userNotLoggedIn;
      }
    } catch (error) {
      log('[SENDIG_DATA_ERROR]:' + error.toString());
      throw DomainErrorType.userNotFound;
    }
  }
}
