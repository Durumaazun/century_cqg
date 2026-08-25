import 'package:flutter/material.dart';

class LoginService extends ChangeNotifier {
  bool _isLoading = false;
  bool _rememberMe = false;
  bool _useSandbox = false;
  String _userId = 'nerve@gmail.com';
  String _password = '';
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get rememberMe => _rememberMe;
  bool get useSandbox => _useSandbox;
  String? get errorMessage => _errorMessage;

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  void setUseSandbox(bool value) {
    _useSandbox = value;
    notifyListeners();
  }

  void setUserId(String value) {
    _userId = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<bool> login() async {
    _errorMessage = null;

    // Validation
    if (_userId.isEmpty) {
      _errorMessage = "User ID cannot be empty";
      notifyListeners();
      return false;
    }

    if (_password.isEmpty) {
      _errorMessage = "Password cannot be empty";
      notifyListeners();
      return false;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Mock successful login (replace with actual API call)
      if (_userId == "nerve@gmail.com" && _password == "Nerve@123") {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = "Invalid User ID or Password";
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = "Login failed: $e";
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
