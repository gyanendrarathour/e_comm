import 'package:e_comm/screens/authUI/signInScreen.dart';
import 'package:e_comm/screens/authUI/welcomeScreen.dart';
import 'package:e_comm/utils/appConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      Get.offAll(()=> WelcomeScreen());
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.appSecondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Lottie.asset('assets/images/splashIcon.json'),
              ),
            ),
            Text(
              AppConstant.createdBy,
              style: const TextStyle(
                  fontSize: 20, 
                  color: AppConstant.appTextColor),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
