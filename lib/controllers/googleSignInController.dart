import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm/models/userModels.dart';
import 'package:e_comm/screens/userPanel/mainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        EasyLoading.show(status: 'Please Wait..');
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
        );

        final UserCredential userCredential = await _auth.signInWithCredential(authCredential);
        final User? user = userCredential.user;

        if(user !=null){
          UserModel userModel = UserModel(
            uId: user.uid,
          userName: user.displayName.toString(),
          email: user.email.toString(),
          phone: user.phoneNumber.toString(),
          userImg: user.photoURL.toString(),
          userDeviceToken: '',
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now());

          await FirebaseFirestore.instance.collection('users').doc(user.uid).set(userModel.toMap());
          EasyLoading.dismiss();

          Get.offAll(()=> const MainScreen());
        }
      }
    } catch (e) {
      EasyLoading.dismiss();
      Get.snackbar('Error', e.toString());
    }
  }
}
