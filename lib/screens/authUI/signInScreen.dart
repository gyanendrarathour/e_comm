import 'package:e_comm/screens/authUI/signUpScreen.dart';
import 'package:e_comm/utils/appConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          backgroundColor: AppConstant.appSecondaryColor,
        ),
        body: Container(
          child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Container(
                      color: AppConstant.appSecondaryColor,
                      child: Center(
                        child: Column(
                          children: [Lottie.asset('assets/images/signIn.json')],
                        ),
                      ),
                    ),
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: AppConstant.appSecondaryColor,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  )),
              // SizedBox(height: Get.height/20,),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      cursorColor: AppConstant.appSecondaryColor,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: const Icon(Icons.visibility_off),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.centerRight,
                child: const Text(
                  'Forget Password',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppConstant.appSecondaryColor),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                width: Get.width / 1.2,
                height: Get.height / 18,
                decoration: BoxDecoration(
                    color: AppConstant.appMainColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 17, color: AppConstant.appTextColor),
                    )),
              ),
              SizedBox(height: Get.height/20,),
              GestureDetector(
                onTap: () => Get.offAll(const SignUpScreen()),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold, color: AppConstant.appSecondaryColor),)
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
