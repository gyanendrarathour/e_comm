import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/userModels.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  // For password visibility
  static var isPasswordVisible = false.obs;

<<<<<<< HEAD
  Future<UserCredential?> signUpWithEmail(String userEmail, userName, userPhone, userCity,
=======
  Future<UserCredential?> signInWithEmail(String userEmail, userName, userPhone, userCity,
>>>>>>> 44a9ef8ec374d4dbc21a39d1e66b3cdda32b4da9
      userPassword, userDeviceToken) async {
        EasyLoading.show(status: 'Please wait...');

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
      // Send email for verification
      await userCredential.user!.sendEmailVerification();
      final User? user = userCredential.user;

      UserModel userModel = UserModel(
          uId: user!.uid,
          userName: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceToken,
          country: '',
          userAddress: '',
          city: userCity,
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now());

      // Add data in firestore
      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(userModel.toMap());
          EasyLoading.dismiss();
          return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', e.toString());
    }
  }
}
