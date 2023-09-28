import 'dart:developer';

import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

class RemoteSignUpEmailPasswordUseCase implements ISignUpEmailPasswordUseCase {
  final IFirebaseAuthClient auth;
  final IHasuraClient hasura;

  RemoteSignUpEmailPasswordUseCase({required this.auth, required this.hasura});

  @override
  Future<AccountEntity?> signUp(SignUpParams params) async {
    try {
      final UserCredential result = await auth.addUserWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      User? user = result.user;

      if (user != null) {
        user.updateDisplayName(params.fullName);

        var document = '''
          mutation insertUser {
            insert_user_one(object: {
              id: "${user.uid}"
              birthday: "${params.birthday}", 
              email: "${params.email}", 
              fullName: "${params.fullName}", 
            }) {
              id
              birthday
              email
              fullName
            }
          }
        ''';

        try {
          final Map<String, dynamic>? response =
              await hasura.mutation(document: document);

          final AccountEntity account = RemoteAccountModel.fromMap(
                  response!['insert_user_one'] as Map<String, dynamic>)
              .toEntity();

          log('[RESPONSE_HAS_DATA]');
          return account;
        } catch (_) {
          rethrow;
        }
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }
}

class RemoteSignUpParams {
  final String fullName;
  final String email;
  final String birthday;

  RemoteSignUpParams(
      {required this.fullName, required this.email, required this.birthday});

  factory RemoteSignUpParams.fromDomain(
    SignUpParams params,
  ) =>
      RemoteSignUpParams(
        fullName: params.fullName,
        email: params.email,
        birthday: params.birthday,
      );

  Map<String, dynamic> toMap() => {
        'fullName': fullName,
        'email': email,
        'birthday': birthday,
      };
}
