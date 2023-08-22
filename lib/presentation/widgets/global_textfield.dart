import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class GlobalTextField extends StatelessWidget {
  const GlobalTextField({super.key, required this.hintText, required this.textInputType,this.isPassword=false, required this.controller, required this.textInputAction});
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        color: AppColors.white,
      ),
      width: 326.w,
      height: 54.h,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: AppColors.textColor,fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          suffixIcon: SizedBox(width: 20.sp,),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodySmall!.copyWith(color: AppColors.textColor),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide:  BorderSide(
                    width: 1, color: AppColors.black.withOpacity(0.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide:  BorderSide(
                    width: 1, color: AppColors.black.withOpacity(0.5))),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide:  BorderSide(
                    width: 1, color: AppColors.black.withOpacity(0.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide:  BorderSide(
                    width: 1, color: AppColors.black.withOpacity(0.5))),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.r),
                borderSide:  BorderSide(
                    width: 1, color: AppColors.black.withOpacity(0.5)))),
      ),
    );
  }
}
