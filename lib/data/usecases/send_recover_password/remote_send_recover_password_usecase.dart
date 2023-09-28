import 'dart:developer';

import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:flutter_core_module/flutter_core_module.dart';

class RemoteSendRecoverPasswordUseCase implements ISendRecoverPasswordUseCase {
  final IFirebaseAuthClient auth;

  RemoteSendRecoverPasswordUseCase({required this.auth});

  @override
  Future<bool> send({required SendRecoverPasswordParams params}) async {
    try {
      await auth.sendPasswordResetEmail(email: params.email);
      log('[SENDIG_DATA_SUCCESS | RemoteSendRecoverPasswordUseCase] to ${params.email}');
      return true;
    } catch (error) {
      log('[SENDIG_DATA_ERROR]:' + error.toString());
      throw DomainErrorType.unexpected;
    }
  }
}
