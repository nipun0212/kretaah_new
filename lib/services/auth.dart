import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:kretaa/util/util.dart';

// class Role {
//   Role({this.isGlobalAdmin, this.isCustomerAdmin});
//   bool isGlobalAdmin;
//   bool isCustomerAdmin;
// }

// class User {
//   User(
//       {@required this.uid,
//       @required this.phoneNumber,
//       @required this.organizationDocId,
//       @required this.role,
//       this.isProfileUpdated});
//   final String uid;
//   final String phoneNumber;
//   final String organizationDocId;
//   final Role role;
//   final bool isProfileUpdated;
// }

abstract class AuthBase {
  void sendOTP(String phoneNumber, firebase_auth.PhoneCodeSent codeSent,
      firebase_auth.PhoneVerificationFailed verificationFailed);
  Future<bool> verifyOTP(String verificationId, String otp);
  Stream<firebase_auth.User> get onAuthStateChanged;
  void signOut();
}

// Future<User> _userFromFirebase(firebase_auth.User user) async {
//   if (user == null) {
//     return null;
//   }
//   bool isGlobalAdmin = false;
//   bool isCustomerAdmin = false;
//   bool isProfileUpdated = false;
//   String organizationDocId;
//   (await user.getIdTokenResult()).claims.forEach((k, v) {
//     print('k= $k and v= $v');
//     if (k == 'isGlobalAdmin') isGlobalAdmin = v;
//     if (k == 'isCustomerAdmin') isCustomerAdmin = v;
//     if (k == 'organizationDocId') organizationDocId = v;
//     if (k == 'isProfileUpdated') isProfileUpdated = v;
//   });
//   var role = new Role();
//   role.isCustomerAdmin = isCustomerAdmin;
//   role.isGlobalAdmin = isGlobalAdmin;
//   return User(
//     uid: user.uid,
//     phoneNumber: user.phoneNumber,
//     role: role,
//     organizationDocId: organizationDocId,
//     isProfileUpdated: isProfileUpdated,
//   );
// }

class Auth implements AuthBase {
  final _firebaseAuth = firebase_auth.FirebaseAuth.instance;
  @override
  Stream<firebase_auth.User> get onAuthStateChanged {
    return _firebaseAuth.authStateChanges();
  }

  @override
  void sendOTP(String phoneNumber, firebase_auth.PhoneCodeSent codeSent,
      firebase_auth.PhoneVerificationFailed verificationFailed) {
    phoneNumber = Util.parsePhoneNumber(phoneNumber);
    _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 30),
        verificationCompleted: (_) => {},
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: (_) => {});
  }

  @override
  Future<bool> verifyOTP(String verificationId, String otp) async {
    firebase_auth.AuthCredential credential =
        firebase_auth.PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    );
    firebase_auth.UserCredential result;
    try {
      result = await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print('Error while verifying otp --> $e');
      return false;
    }
    if (result.user.uid != null) return true;
    return false;
  }

  @override
  void signOut() {
    _firebaseAuth.signOut();
  }
}
