import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/utils/extension.dart';

import '../../../cubits/auth/auth_cubit.dart';
import '../../widgets/global_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.usernameController, required this.contactController, required this.emailController, required this.passwordController, required this.professionController, required this.roleController, required this.genderController});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController contactController;
  final TextEditingController professionController;
  final TextEditingController roleController;
  final TextEditingController genderController;


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
              hintText: "User Name",
              textInputType: TextInputType.emailAddress,
              controller: usernameController,
              textInputAction: TextInputAction.next),
          10.ph,
          GlobalTextField(
              hintText: "Email",
              textInputType: TextInputType.emailAddress,
              controller: emailController,
              textInputAction: TextInputAction.next),
          10.ph,
          GlobalTextField(
              hintText: "Password",
              textInputType: TextInputType.emailAddress,
              controller: passwordController,
              textInputAction: TextInputAction.next),
          10.ph,
          GlobalTextField(
              hintText: "Contact",
              textInputType: TextInputType.emailAddress,
              controller: contactController,
              textInputAction: TextInputAction.next),
          10.ph,
          GlobalTextField(
              hintText: "Profession",
              textInputType: TextInputType.emailAddress,
              controller: professionController,
              textInputAction: TextInputAction.next),
          10.ph,
          GlobalTextField(
              hintText: "Role",
              textInputType: TextInputType.emailAddress,
              controller: roleController,
              textInputAction: TextInputAction.next),
          10.ph,
          GlobalTextField(
              hintText: "Gender",
              textInputType: TextInputType.emailAddress,
              controller: genderController,
              textInputAction: TextInputAction.next),
          10.ph,
        ],
      );
    },);
  }
}
