import 'package:e_shop/features/auth/model/auth_user.dart';

abstract class AuthRepo {
  Future<void> initialize();

  AuthUser? get currentUser;

  Future<String?> get username;

  Future<AuthUser> createUser({
    required String name,
    required String email,
    required String password,
  });

  Future<AuthUser> logIn({
    required email,
    required password,
  });

  Future<void> logOut();

  Future<void> sendEmailVerification();

  Future<void> sendPasswordReset({required String toEmail});
}
