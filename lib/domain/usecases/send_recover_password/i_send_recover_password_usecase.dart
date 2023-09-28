// ignore_for_file: public_member_api_docs, sort_constructors_first
mixin ISendRecoverPasswordUseCase {
  Future<bool> send({required SendRecoverPasswordParams params});
}

class SendRecoverPasswordParams {
  final String email;

  const SendRecoverPasswordParams({required this.email});

  @override
  bool operator ==(covariant SendRecoverPasswordParams other) {
    if (identical(this, other)) return true;

    return other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
