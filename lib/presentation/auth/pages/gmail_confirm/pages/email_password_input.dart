import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/auth/auth_cubit.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_textfield.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../../utils/colors.dart';

class EmailPasswordInput extends StatefulWidget {
  const EmailPasswordInput(
      {super.key,
      required this.gmailController,
      required this.passwordController});

  final TextEditingController gmailController;
  final TextEditingController passwordController;

  @override
  State<EmailPasswordInput> createState() => _EmailPasswordInputState();
}

class _EmailPasswordInputState extends State<EmailPasswordInput> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
      if(state is AuthLoadingState){
        return const Center(child: CircularProgressIndicator(),);
      }
      return  Column(
        children: [
          20.ph,
          GlobalTextField(
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              controller: widget.gmailController,
              textInputAction: TextInputAction.next),
          50.ph,
          Stack(
            children: [
              GlobalTextField(
                hintText: "Password",
                textInputType: TextInputType.visiblePassword,
                controller: widget.passwordController,
                isPassword: isVisible,
                textInputAction: TextInputAction.done,
              ),
              Positioned(
                right: 10.w,
                top: 12.h,
                child: ZoomTapAnimation(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                    color: isVisible
                        ? AppColors.passiveTextColor
                        : AppColors.c_005FEE,
                  ),
                ),
              )
            ],
          ),
        ],
      );
    },);
  }
}
