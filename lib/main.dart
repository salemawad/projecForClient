import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/screens/colors.dart';
import 'package:untitled/screens/no_internet.dart';
import 'package:untitled/screens/splash_screen.dart';

void main() {
  checkInternetConnectivity();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}


bool isConnect= false;
void checkInternetConnectivity() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnect=true;
    }
  } on SocketException catch (_) {
      isConnect=false;

  }
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isConnect?const SplashScreen():const NoInternet(),
       theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
            elevation: 0
      )),
    );
  }
}
