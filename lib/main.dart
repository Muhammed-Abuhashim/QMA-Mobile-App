
// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:main/otp.dart';
import 'package:main/screans/about.dart';
import 'package:main/screans/contact.dart';
import 'package:main/screans/guardian_sign_up.dart';
import 'package:main/screans/help.dart';
import 'package:main/screans/home.dart';
import 'package:main/screans/home2.dart';
import 'package:main/screans/login.dart';
import 'package:main/screans/my_contact.dart';
import 'package:main/screans/patient_sign_up.dart';
import 'package:main/screans/profile.dart';
import 'package:main/screans/sign_up.dart';
import 'package:main/screans/splashscrean.dart';
import 'package:get/get.dart';
import 'screans/download.dart';
import 'screans/med_his.dart';
import 'screans/reset.dart';
import 'screans/stream.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScrean.id,
      routes:{
        SplashScrean.id:(context) =>  SplashScrean(),
        home.id:(context) =>  home(),
        home2.id:(context) =>  home2(),
        about.id:(context) =>  about(),
        contact.id:(context) =>  contact(),
        my_contact.id:(context) =>  my_contact(),
        CurrentLocationScreen.id:(context) =>  CurrentLocationScreen(),
        stream.id:(context) =>  stream(),
        dwonload.id:(context) =>  dwonload(),
        med_his.id:(context) =>  med_his(),
        login.id:(context) =>  login(),
        sign_up.id:(context) =>  sign_up(),
        sign_up.id:(context) => guardian_sign_up(),
        sign_up.id:(context) =>  patient_sign_up(),
        ResetScreen.id:(context) =>  ResetScreen(),
        help.id:(context) =>  help(),
        otp.id:(context) =>   otp(),
        CurrentLocationScreen.id:(context) =>   CurrentLocationScreen(),
      },
    );
  }
}


