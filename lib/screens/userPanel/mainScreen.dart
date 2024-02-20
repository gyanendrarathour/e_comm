import 'package:e_comm/screens/authUI/welcomeScreen.dart';
import 'package:e_comm/utils/appConstant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appMainColor,
          title: Text(AppConstant.appMainName),
          actions: [
            IconButton(onPressed: ()async{
              GoogleSignIn googleSignIn = GoogleSignIn();
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
              await googleSignIn.signOut();
              Get.offAll(()=>WelcomeScreen());
            }, icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
