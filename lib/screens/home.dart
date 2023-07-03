import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/screens/direct_screen.dart';
import 'package:untitled/widget/dialogWidget.dart';

import 'colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentPageIndex = 0;

  List images = [
    'images/one.jpg',
    'images/ow.jpg',
    'images/three.jpg',
  ];
  List text = [
    'Red circle marks goal!',
    'support all mode!',
    'Goal in on shot!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(children: [
        Expanded(
          child: PageView.builder(
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),


                  Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: 300,
                      child: Text(
                        text[index],
                        style: GoogleFonts.ibmPlexSans(color: Colors.white,fontSize: 25),
                        textAlign: TextAlign.center,
                      )),
                ],
              );
            },
            // controller: _pageController,
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                width: _currentPageIndex == index ? 15 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: _currentPageIndex == index
                      ? AppColors.colorButton
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 320,
          height: 48,
          child: MaterialButton(
            color: AppColors.colorButton,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const DialogWidget();
                },
              );
              Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    Navigator.pop(context);
                    return Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DirectScreen(),
                      ));
                  });

            },
            child:  Text(
              'Direct Enter',
              style: GoogleFonts.ibmPlexSans(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ]),
    );
  }
}
