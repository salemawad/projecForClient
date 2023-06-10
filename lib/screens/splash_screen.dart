import 'package:flutter/material.dart';
import 'package:untitled/screens/home.dart';
import 'colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () =>
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home(),)),);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset('images/logo.png')),
          Positioned(
            bottom: 20,
            left: 80,
            right: 80,
            child: Row(
              children: const [
                CircularProgressIndicator(
                  color: AppColors.colorButton,
                ),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Loading, Please Wait...',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
