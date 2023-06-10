import 'package:flutter/material.dart';

import '../screens/colors.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return const Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 160),
          backgroundColor: AppColors.background,
          child: SizedBox(
            height: 70,
            width: 40,
            child: Center(
                child: CircularProgressIndicator(
                    color: AppColors.colorButton)),
          ),
        );

  }
}
