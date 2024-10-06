import 'package:e_shop/features/auth/model/auth_user.dart';
import 'package:e_shop/features/auth/repository/auth_exceptions.dart';
import 'package:e_shop/features/auth/repository/firebase_repo.dart';
import 'package:flutter/material.dart';
// import 'dart:developer' as devtool show log;

class AuthViewModel extends ChangeNotifier {
  AuthUser? _user;
  String? _errorMessage;
  bool _isLoading = false;
  String _loadingText = '';

  AuthUser? get user => _user;
  bool get isAuthenticated => _user != null;
  bool get isEmailVerified => _user != null && _user!.isEmailVerified;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  String get loadingText => _loadingText;

  AuthViewModel() {
    initialize();
  }

  //  Initialize Firebase function
  initialize() async {
    _user = FirebaseRepo().currentUser;
    notifyListeners();
  }

  //  Signup User function
  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loadingTrue(text: 'Registering User..');
      await FirebaseRepo().createUser(
        name: name,
        email: email,
        password: password,
      );
      await FirebaseRepo().sendEmailVerification();
      _errorMessage = null;
    } on WeakPasswordAuthException {
      _errorMessage = 'Your password is too weak.';
    } on EmailAlreadyInUseAuthException {
      _errorMessage = 'This email is already in use.';
    } on InvalidEmailAuthException {
      _errorMessage = 'The email address is invalid.';
    } on UserNotFoundAuthException {
      _errorMessage = 'User not found. Please register first.';
    } on GenericAuthException {
      _errorMessage = 'Failed to sign up. Please try again.';
    } finally {
      _loadingFalse();
    }
  }

  //  Login User function
  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      _loadingTrue(text: 'Logging user in..');
      final loggedInUser =
          await FirebaseRepo().logIn(email: email, password: password);
      final name = await FirebaseRepo().username;
      _user = AuthUser(
        id: loggedInUser.id,
        email: loggedInUser.email,
        isEmailVerified: loggedInUser.isEmailVerified,
        name: name,
      );
      _errorMessage = null;
    } on UserNotFoundAuthException {
      _errorMessage = 'User not found. Please register first.';
    } on InvalidCredentialAuthException {
      _errorMessage = 'Invalid credentials. Please try again.';
    } on GenericAuthException {
      _errorMessage = 'Failed to sign in. Please try again.';
    } finally {
      _loadingFalse();
    }
  }

  //  Logout User function
  Future<void> logout() async {
    try {
      _loadingTrue(text: 'Logging Out..');
      await FirebaseRepo().logOut();
      _user = null;
      _errorMessage = null;
    } on UserNotFoundAuthException {
      _errorMessage = 'User not found!';
    } finally {
      _loadingFalse();
    }
  }

  //  Send Email Verification function
  Future<void> sendEmailVerification() async {
    try {
      _loadingTrue(text: 'Sending verification email..');
      await FirebaseRepo().sendEmailVerification();

      _errorMessage = null;
    } on UserNotFoundAuthException {
      _errorMessage = 'User not found!';
    } on GenericAuthException {
      _errorMessage = 'Failed to send verification link. Please try again.';
    } finally {
      _loadingFalse();
    }
  }

  //  Send Password reset link function
  Future<void> sendPasswordReset({
    required String toEmail,
  }) async {
    try {
      _loadingTrue(text: 'Sending password reset link..');
      await FirebaseRepo().sendPasswordReset(toEmail: toEmail);
    } on InvalidEmailAuthException {
      _errorMessage = 'The email address is invalid.';
    } on GenericAuthException {
      _errorMessage =
          'Failed to send the password reset link. Please try again!';
    } finally {
      _loadingFalse();
    }
  }

  clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  _loadingTrue({required String text}) {
    _isLoading = true;
    _loadingText = text;
    notifyListeners();
  }

  _loadingFalse() {
    _isLoading = false;
    _loadingText = '';
    notifyListeners();
  }
}
