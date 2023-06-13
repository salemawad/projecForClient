import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Helpers {

  void ShowSnackBar(
      BuildContext context, {
        required String content,
      }){
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(bottom: 120,
            left: 70,right: 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(seconds: 2),
        content:  Text(
          content,
          textAlign: TextAlign.center,
          style:   GoogleFonts.ibmPlexSans(
              color: Colors.white),
        )));
  }

}
