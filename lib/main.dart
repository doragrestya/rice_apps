import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gorice/ui_page/DashboardPage.dart';
import 'package:gorice/ui_page/SplashScreenPage.dart';
import 'package:gorice/ui_page/home/HomePage.dart';
import 'package:gorice/ui_page/profile/LoginPage.dart';

void main() => runApp(MaterialApp(
      home: SplashScreenPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        //Color(0xFF512DA8),
        accentColor: Color(0xFFEDE7F6),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
      ),
    ));
