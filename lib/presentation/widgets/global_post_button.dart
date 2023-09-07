import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalPostButton extends StatelessWidget {
  const GlobalPostButton({super.key, required this.text, required this.onTap});
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ZoomTapAnimation(
          onTap: onTap,
          child: Container(
            width: 72.w,
            height: 36.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.c_005FEE
            ),
            child: Center(child: Text(text,style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18.sp,color: AppColors.white),)),
          ),
        )
      ],
    );
  }
}
