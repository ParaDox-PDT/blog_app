import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:lottie/lottie.dart';


void showLoading({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: AlignmentDirectional.center,
          decoration: const BoxDecoration(),
          child:  Center(
            child: SizedBox(
              height: 70.0,
              width: 70.0,
              child: Lottie.asset(AppImages.loading2)
            ),
          ),
        ),
      );
    },
  );
}

void hideLoading({required BuildContext? dialogContext}) async {
  if (dialogContext != null) Navigator.pop(dialogContext);
}