// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

mixin ISignInEmailPasswordUseCase {
  Future<AccountEntity?> signIn(SignInParams params);
}

class SignInParams {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  bool operator ==(covariant SignInParams other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
