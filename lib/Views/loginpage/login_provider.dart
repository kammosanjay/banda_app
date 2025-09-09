import 'package:baanda_mobile_app/MyPageRoute/route_provider.dart';
import 'package:baanda_mobile_app/Views/OTP/otp_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:baanda_mobile_app/Views/loginpage/loginmodal.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';

class LoginProvider extends ChangeNotifier {
  final box = GetStorage();
  String? storedEmail;
  String? storedPassword;
  bool isRememberMeChecked = false;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  void sendOtp(String phone, BuildContext context) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),

      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto verification (Android only)
        await _auth.signInWithCredential(credential);
        debugPrint("✅ Auto verified and logged in!");
      },

      verificationFailed: (FirebaseAuthException e) {
        debugPrint("❌ Verification failed: ${e.message}");
      },

      codeSent: (String verId, int? resendToken) {
        verificationId = verId; // save for later
        debugPrint("📩 OTP sent to $phone");
        debugPrint("Saved verificationId: $verificationId");
       
      },

      codeAutoRetrievalTimeout: (String verId) {  
        verificationId = verId;
      },
    );
  }

  void verifyOtp(String smsCode) async {
    if (verificationId != null) {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode,
      );

      try {
        await _auth.signInWithCredential(credential);
        print("🎉 OTP Verified Successfully, User Logged In");
      } catch (e) {
        print("❌ Invalid OTP: $e");
      }
    }
  }
}
