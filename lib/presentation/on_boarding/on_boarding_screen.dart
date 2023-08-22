import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_button.dart';
import 'package:flutter_defualt_project/utils/constants.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              115.ph,
              Lottie.asset(AppImages.blog2, height: 230.h),
              70.ph,
              Text(
                "Hey! Welcome",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              32.ph,
              SizedBox(
                width: 284.w,
                child: Text(
                  onBoardingText,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ),
              30.ph,
              GlobalButton(
                  text: "SIGN IN",
                  onTap: () {
                    Navigator.pushReplacementNamed(context, RouteNames.auth,
                        arguments: true);
                  }),
              20.ph,
              // GlobalButton(
              //   text: "CREATE AN ACCOUNT",
              //   onTap: () {
              //     Navigator.pushReplacementNamed(context, RouteNames.auth,
              //         arguments: false);
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
