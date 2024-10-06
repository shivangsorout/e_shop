import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String id;
  final String email;
  final bool isEmailVerified;
  final String? name;

  AuthUser({
    required this.id,
    required this.email,
    required this.isEmailVerified,
    this.name,
  });

  factory AuthUser.fromFirestore(User user) {
    return AuthUser(
      id: user.uid,
      email: user.email!,
      isEmailVerified: user.emailVerified,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      idKey: id,
      emailKey: email,
      isEmailVerifiedKey: isEmailVerified,
    };
  }
}

const idKey = 'id';
const nameKey = 'name';
const emailKey = 'email';
const isEmailVerifiedKey = 'isEmailVerified';
