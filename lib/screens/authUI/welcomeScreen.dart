import 'package:e_comm/utils/appConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppConstant.appMainColor,
            child: Lottie.asset('assets/images/cart.json'),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Happy Shopping',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          Container(
            width: Get.width / 1.2,
            height: Get.height / 12,
            decoration: BoxDecoration(
                color: AppConstant.appMainColor,
                borderRadius: BorderRadius.circular(20)),
            child: TextButton.icon(
                onPressed: () {},
                icon: Image.asset('assets/images/google-logo.png'),
                label: const Text(
                  'Sign in with google',
                  style:
                      TextStyle(fontSize: 17, color: AppConstant.appTextColor),
                )),
          ),
          SizedBox(
            height: Get.height / 50,
          ),
          Container(
            width: Get.width / 1.2,
            height: Get.height / 12,
            decoration: BoxDecoration(
                color: AppConstant.appMainColor,
                borderRadius: BorderRadius.circular(20)),
            child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.email,
                  color: AppConstant.appTextColor,
                  size: 40,
                ),
                label: const Text(
                  'Sign in with email',
                  style:
                      TextStyle(fontSize: 17, color: AppConstant.appTextColor),
                )),
          )
        ],
      ),
    );
  }
}
