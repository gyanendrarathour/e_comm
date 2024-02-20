import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // For password visibility
  static var isPasswordVisible = false.obs;

  Future<UserCredential?> signInWithEmail(String userEmail, userPassword) async {
        EasyLoading.show(status: 'Please wait...');

    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
              email: userEmail, password: userPassword);      
          EasyLoading.dismiss();
          return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', e.toString());
    }
  }
}
