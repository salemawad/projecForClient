import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untitled/screens/splash_screen.dart';
import 'package:untitled/widget/dialogWidget.dart';

import '../widget/snack.dart';
import 'colors.dart';
import 'home.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet>with Helpers {
  bool isConnected = false;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Image.asset('images/nointernet.png'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "There's no internet connection",
            style: TextStyle(
                color: AppColors.colorButton,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              '''Sorry, there is no internet on your device. Please check your network
               and try again!''',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 320,
            height: 45,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.colorButton)),
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return const DialogWidget();
                    },
                  );
                  Future.delayed(const Duration(seconds: 2),() async{
                    Navigator.pop(context);
                    await  checkInternet();
                  },);
                },
                child: const Text(
                  'TRY AGAIN',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ]),
      ),
    );
  }
   checkInternet()async{
     try {
       final result = await InternetAddress.lookup('google.com');
       if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
         Navigator.pushReplacement(
             context,
             MaterialPageRoute(
               builder: (context) =>  const SplashScreen(),
             ));
       }
     } on SocketException catch (_) {
       ShowSnackBar(context, content: "There's no connection, Try again!");
     }
   }
}
