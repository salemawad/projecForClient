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
  void initState() {
    Future.delayed(const Duration(seconds: 3), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Home(),))
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Center(child: Image.asset('images/logo.png')),
          const Positioned(
            bottom: 20,
            left: 80,
            right: 80,
            child: Row(
              children: [
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
