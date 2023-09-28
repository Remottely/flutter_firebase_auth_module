import 'dart:developer';

import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

class RemoteSignInEmailPasswordUseCase implements ISignInEmailPasswordUseCase {
  final IFirebaseAuthClient auth;
  final IHasuraClient hasura;

  RemoteSignInEmailPasswordUseCase({required this.auth, required this.hasura});

  @override
  Future<AccountEntity?> signIn(SignInParams params) async {
    try {
      final result = await auth.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );

      if (result.user != null) {
        const String docKey = 'user_by_pk';

        var document = '''
          query getUserByPk {
            $docKey(id: "${result.user?.uid}") {
              id
              birthday
              email
              fullName
            }
          }
        ''';

        try {
          final Map<String, dynamic>? response =
              await hasura.query(document: document);

          final AccountEntity account = RemoteAccountModel.fromMap(
                  response?[docKey] as Map<String, dynamic>)
              .toEntity();

          log('[RESPONSE_HAS_DATA]');
          return account;
        } catch (error) {
          log('[MANIPULATING_DATA_ERROR]:' + error.toString());
          rethrow;
        }
      }
    } catch (error) {
      log('[SIGNIN_ERROR]:' + error.toString());
      rethrow;
    }
    return null;
  }
}

class RemoteSignInAccountUseCaseImplParams {
  final String email;
  final String password;

  RemoteSignInAccountUseCaseImplParams(
      {required this.email, required this.password});

  factory RemoteSignInAccountUseCaseImplParams.fromDomain(
          {required SignInParams params}) =>
      RemoteSignInAccountUseCaseImplParams(
        email: params.email,
        password: params.password,
      );

  Map<String, dynamic> toMap() => {
        'email': email,
        'password': password,
      };
}
