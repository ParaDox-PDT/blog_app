import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/auth/auth_cubit.dart';
import 'package:flutter_defualt_project/presentation/auth/pages/gmail_confirm/pages/code_confirm.dart';
import 'package:flutter_defualt_project/presentation/auth/pages/gmail_confirm/pages/email_password_input.dart';
import 'package:flutter_defualt_project/presentation/auth/pages/register_page.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_button.dart';

import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen(
      {super.key, required this.onChanged, required this.parentContext});

  final VoidCallback onChanged;
  final BuildContext parentContext;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ImagePicker picker = ImagePicker();
  PageController pageController = PageController();
  int currentPage = 0;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController gmailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        return  ListView(
          children: [
            Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                112.ph,
                Text(
                  "Create Your Account",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Row(
                  children: [
                    Text(
                      "Do you already have an account?",
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
                        "SIGN IN",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: AppColors.c_005FEE),
                      ),
                    ),
                  ],
                ),
                32.ph,
                SizedBox(
                  height: 470.h,
                  child: PageView(
                    controller: pageController,
                    physics:const NeverScrollableScrollPhysics(),
                    children: [
                      EmailPasswordInput(
                        gmailController: gmailController,
                        passwordController: passwordController,
                      ),
                      CodeConfirm(
                        codeController: codeController,
                      ),
                      RegisterPage(
                          usernameController: usernameController,
                          contactController: contactController,
                          emailController: gmailController,
                          passwordController: passwordController,
                          professionController: professionController,
                          roleController: roleController,
                          genderController: genderController)
                    ],
                  ),
                ),
                Visibility(
                  visible: state is! AuthLoadingState,
                  child: Center(
                    child: GlobalButton(
                      text: currentPage == 0
                          ? "SEND CONFIRM CODE"
                          : currentPage == 1
                          ? "CONFIRM CODE"
                          : "SIGN UP",
                      onTap: () {
                        if (currentPage == 0) {
                          context.read<AuthCubit>().sendCodeToGmail(
                              gmail: gmailController.text,
                              password: passwordController.text);
                        } else if (currentPage == 1) {
                          context
                              .read<AuthCubit>()
                              .confirmCode(code: codeController.text);
                        } else if (currentPage == 2) {
                          // context.read<AuthCubit>().
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          )],
        );
      },
      listener: (context, state) {
        if(state is AuthErrorState){
          showErrorMessage(message: state.errorText, context: context);
        }
        if (state is AuthSendCodeSuccessState) {
          currentPage = 1;
          gmailController.clear();
          passwordController.clear();
          pageController.animateToPage(
            1,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          );
        }
        if (state is AuthConfirmCodeSuccessState) {
          currentPage = 2;
          pageController.animateToPage(
            2,
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
          );
        }
      },
    );
  }
}
