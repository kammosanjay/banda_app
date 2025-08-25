import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:baanda_mobile_app/Views/loginpage/loginmodal.dart';

class LoginProvider extends ChangeNotifier {
  final box = GetStorage();
  String? storedEmail;
  String? storedPassword;
  bool isRememberMeChecked = false;

  LoginProvider() {
    // Load from storage when provider starts
    storedEmail = box.read("email");
    storedPassword = box.read("password");
    isRememberMeChecked = box.read("isRememberMe") ?? false;
    print("-->${isLoggedIn()}");

    
  }

  /// First-time login: save credentials
  void login(Loginmodal loginmodal) {
    box.write("email", loginmodal.email);
    box.write("password", loginmodal.password);

    storedEmail = loginmodal.email;
    storedPassword = loginmodal.password;

    debugPrint("Saved Email: $storedEmail, Password: $storedPassword");

    notifyListeners();
  }

  /// Validate login against stored credentials
  bool validateLogin(String email, String password) {
    final savedEmail = box.read("email");
    final savedPassword = box.read("password");

    return (savedEmail == email && savedPassword == password);
  }

  /// Check if user is logged in
  bool isLoggedIn() {
    return storedEmail != null && storedPassword != null;
  }

  /// Logout and clear credentials
  void logout() {
    box.remove("email");
    box.remove("password"); 
    storedEmail = null;
    storedPassword = null;
    notifyListeners();
  }

  /// Save "Remember Me" preference
  void setRememberMe(bool? value) {
    isRememberMeChecked = value ?? false;
    box.write("isRememberMe", isRememberMeChecked);
    debugPrint("isRememberMe: $isRememberMeChecked");
    notifyListeners();
  }
}
