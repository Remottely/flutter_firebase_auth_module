class AccountEntity {
  final String? token;
  final String id;
  final String fullName;
  final String email;
  final String birthday;

  const AccountEntity(
      {this.token,
      required this.id,
      required this.fullName,
      required this.email,
      required this.birthday});

  factory AccountEntity.fromMap(Map<String, dynamic> map) {
    return AccountEntity(
      id: map['id'].toString(),
      fullName: map['fullName'].toString(),
      email: map['email'].toString(),
      birthday: map['birthday'].toString(),
    );
  }

  Map<String, dynamic> toMap(AccountEntity entity) {
    return {
      'id': entity.id,
      'fullName': entity.fullName,
      'email': entity.email,
      'birthday': entity.birthday,
    };
  }

  @override
  bool operator ==(covariant AccountEntity other) {
    if (identical(this, other)) return true;

    return other.token == token &&
        other.id == id &&
        other.fullName == fullName &&
        other.email == email &&
        other.birthday == birthday;
  }

  @override
  int get hashCode {
    return token.hashCode ^
        id.hashCode ^
        fullName.hashCode ^
        email.hashCode ^
        birthday.hashCode;
  }
}
