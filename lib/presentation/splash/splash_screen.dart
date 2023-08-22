import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init()async{
    await Future.delayed(const Duration(seconds: 3));
    if(context.mounted){
      Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
    }

  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c_005FEE,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Blog App",textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 96.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w300),
              ),
              Lottie.asset(AppImages.blog)
            ],
          ),
        ),
      ),
    );
  }
}
