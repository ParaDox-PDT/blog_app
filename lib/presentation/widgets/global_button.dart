import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../utils/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTap,
      child: Container(
        width: 278.w,
        height: 36.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.c_005FEE
        ),
        child: Center(
          child: Text(text,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.white,letterSpacing: 1.25.sp),),
        ),
      ),
    );
  }
}
