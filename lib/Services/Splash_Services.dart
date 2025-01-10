import 'package:comic_reading_app/View/Authentication/SignUpScreen/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

class Services {


  void isLogin(BuildContext context){
    Timer(const Duration(seconds: 4), () {
     Get.to(() => SignUpScreen());
    });

  }





}