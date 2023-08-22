import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/auth/auth_cubit.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_button.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_textfield.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/ui_utils/error_message_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onChanged});

  final VoidCallback onChanged;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        if(state is AuthLoadingState){
          return Center(child: Lottie.asset(AppImages.loading2),);
        }
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  204.ph,
                  Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don’t have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.passiveTextColor),
                      ),
                      10.pw,
                      TextButton(
                          onPressed: () {
                            widget.onChanged.call();
                          },
                          child: Text(
                            "SIGN UP",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: AppColors.c_005FEE),
                          )),
                    ],
                  ),
                  30.ph,
                  Visibility(
                    child: GlobalTextField(
                        hintText: "Email",
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        controller: emailController),
                  ),
                  32.ph,
                  Stack(
                    children: [
                      GlobalTextField(
                        hintText: "Password",
                        textInputType: TextInputType.visiblePassword,
                        controller: passwordController,
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
                  60.ph,
                  Center(
                    child: GlobalButton(
                      text: "SIGN IN",
                      onTap: () {
                        context.read<AuthCubit>().loginUser(
                            gmail: emailController.text,
                            password: passwordController.text);
                      },
                    ),
                  ),
                  20.ph
                ],
              ),
            )
          ],
        );
      },
      listener: (context, state) {
        if (state is AuthErrorState) {
          showErrorMessage(message: state.errorText, context: context);
        }
        if (state is AuthLoggedState) {
          StorageRepository.putBool("isStart", true);
          Navigator.pushReplacementNamed(context, RouteNames.tabBox);
        }
      },
    );
  }
}
