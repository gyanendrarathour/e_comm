import 'package:e_comm/firebase_options.dart';
import 'package:e_comm/utils/appConstant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'screens/authUI/splashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Comm',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true, foregroundColor: AppConstant.appTextColor, iconTheme: IconThemeData(color: AppConstant.appTextColor)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    );
  }
}