import 'package:e_comm/screens/authUI/welcomeScreen.dart';
import 'package:e_comm/utils/appConstant.dart';
import 'package:e_comm/widgets/bannerWidget.dart';
import 'package:e_comm/widgets/customDrawerWidget.dart';
import 'package:e_comm/widgets/headingWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text(AppConstant.appMainName),
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              const BannerWidget(),
              HeadingWidget(
                  headingTitle: 'Categories',
                  headingSubTitle: "According to your budget",
                  onTap: () {},
                  buttonText: 'See More >>>')
            ],
          ),
        ),
      ),
    );
  }
}
