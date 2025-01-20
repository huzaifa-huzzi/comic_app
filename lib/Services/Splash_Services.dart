import 'package:comic_reading_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:comic_reading_app/View/Authentication/SignUpScreen/SignUpScreen.dart';
import 'package:comic_reading_app/View/DashBoardScreen/DashBoardScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Services {


  void isLogin(BuildContext context){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    Future.delayed(Duration.zero, () {
      if(user != null){
        Get.to(() =>const  DashboardScreen(),transition: Transition.fade,duration:const  Duration(seconds: 3));
      }else{
        Get.to(() => const  LoginScreen());
      }
    });
  }





}