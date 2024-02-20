<<<<<<< HEAD
=======
import 'dart:ffi';

>>>>>>> 44a9ef8ec374d4dbc21a39d1e66b3cdda32b4da9
import 'package:e_comm/controllers/signUpController.dart';
import 'package:e_comm/screens/authUI/signInScreen.dart';
import 'package:e_comm/screens/authUI/welcomeScreen.dart';
import 'package:e_comm/utils/appConstant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
=======
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';
>>>>>>> 44a9ef8ec374d4dbc21a39d1e66b3cdda32b4da9

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignUpScreen> {
  final SignUpController _signUpController = Get.put(SignUpController());
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          backgroundColor: AppConstant.appSecondaryColor,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Welcome to my app',
                      style: TextStyle(
                          fontSize: 20, color: AppConstant.appMainColor),
                    )),
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                            hintText: 'User Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                            hintText: 'Mobile',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: cityController,
                        keyboardType: TextInputType.streetAddress,
                        cursorColor: AppConstant.appSecondaryColor,
                        decoration: InputDecoration(
                            hintText: 'City',
                            prefixIcon: const Icon(Icons.location_city),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => TextFormField(
                            controller: passwordController,
                            obscureText:
                                SignUpController.isPasswordVisible.value,
                            keyboardType: TextInputType.visiblePassword,
                            cursorColor: AppConstant.appSecondaryColor,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      SignUpController.isPasswordVisible
                                          .toggle();
                                    },
                                    icon:
                                        SignUpController.isPasswordVisible.value
                                            ? const Icon(Icons.visibility_off)
                                            : const Icon(Icons.visibility)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          )),
                    )),
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
                      onPressed: () async{
                        String email = emailController.text.trim();
                        String userName = nameController.text.trim();
                        String phone = phoneController.text.trim();
                        String city = cityController.text.trim();
                        String password = passwordController.text.trim();
                        String userDeviceToken = '';

                        if (email.isEmpty ||
                            userName.isEmpty ||
                            phone.isEmpty ||
                            city.isEmpty ||
                            password.isEmpty) {
                          Get.snackbar('Error', 'Please enter all the details');
                        } else {
                          UserCredential? userCredential =await SignUpController()
<<<<<<< HEAD
                              .signUpWithEmail(email, userName, phone,
=======
                              .signInWithEmail(email, userName, phone,
>>>>>>> 44a9ef8ec374d4dbc21a39d1e66b3cdda32b4da9
                                  city, password, userDeviceToken);
                                  if(userCredential!=null){
                                    Get.snackbar('Verification Email Sent', 'Please check your email');
                                    FirebaseAuth.instance.signOut();
                                    Get.offAll(()=> WelcomeScreen());
                                  }
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 17, color: AppConstant.appTextColor),
                      )),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                GestureDetector(
                  onTap: () => Get.offAll(const SignInScreen()),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? "),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppConstant.appSecondaryColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
