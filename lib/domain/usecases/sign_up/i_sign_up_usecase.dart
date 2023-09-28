// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';

mixin ISignUpEmailPasswordUseCase {
  Future<AccountEntity?> signUp(SignUpParams params);
}

class SignUpParams {
  final String fullName;
  final String email;
  final String birthday;
  final String password;
  final String passwordConfirmation;

  const SignUpParams(
      {required this.fullName,
      required this.email,
      required this.birthday,
      required this.password,
      required this.passwordConfirmation});

  @override
  bool operator ==(covariant SignUpParams other) {
    if (identical(this, other)) return true;

    return other.fullName == fullName &&
        other.email == email &&
        other.birthday == birthday &&
        other.password == password &&
        other.passwordConfirmation == passwordConfirmation;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        email.hashCode ^
        birthday.hashCode ^
        password.hashCode ^
        passwordConfirmation.hashCode;
  }
}
