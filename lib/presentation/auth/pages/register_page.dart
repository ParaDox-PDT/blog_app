import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/presentation/auth/widgets/gender_selector.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../cubits/auth/auth_cubit.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../widgets/global_textfield.dart';

class RegisterPage extends StatefulWidget {
   const RegisterPage(
      {super.key,
      required this.usernameController,
      required this.contactController,
      required this.emailController,
      required this.passwordController,
      required this.professionController,
      required this.genderController,});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;
  final TextEditingController contactController;
  final TextEditingController professionController;
  final TextEditingController genderController;


  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  ImagePicker picker = ImagePicker();
  late XFile? file;

  @override
  void initState() {
    file= context.read<AuthCubit>().getXFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoadingState) {
          return Center(
            child: Lottie.asset(AppImages.loading2),
          );
        }
        return Column(
          children: [
            20.ph,
            GlobalTextField(
                hintText: "User Name",
                textInputType: TextInputType.emailAddress,
                controller: widget.usernameController,
                textInputAction: TextInputAction.next),
            10.ph,
            GlobalTextField(
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                controller: widget.emailController,
                textInputAction: TextInputAction.next),
            10.ph,
            GlobalTextField(
                hintText: "Password",
                textInputType: TextInputType.emailAddress,
                controller: widget.passwordController,
                textInputAction: TextInputAction.next),
            10.ph,
            GlobalTextField(
                hintText: "Contact",
                textInputType: TextInputType.emailAddress,
                controller: widget.contactController,
                textInputAction: TextInputAction.next),
            10.ph,
            GlobalTextField(
                hintText: "Profession",
                textInputType: TextInputType.emailAddress,
                controller: widget.professionController,
                textInputAction: TextInputAction.next),
            10.ph,
            GenderSelector(
                onMaleTap: () {
                  setState(() {
                    context.read<AuthCubit>().changeGender(1);
                  });
                },
                onFemaleTap: () {
                  setState(() {
                    context.read<AuthCubit>().changeGender(0);
                  });
                },
                gender: context.read<AuthCubit>().getGender()),
            10.ph,
            TextButton(
                onPressed: () {
                  showBottomSheetDialog();
                },
                child: const Text("Select image"))
          ],
        );
      },
    );
  }

  void showBottomSheetDialog() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 200,
          decoration: const BoxDecoration(
            color: AppColors.c_005FEE,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _getFromCamera();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text("Select from Camera"),
              ),
              ListTile(
                onTap: () {
                  _getFromGallery();
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.photo),
                title: const Text("Select from Gallery"),
              )
            ],
          ),
        );
      },
    );
  }

  Future<void> _getFromCamera() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 512,
      maxWidth: 512,
    );

    if (xFile != null) {
      setState(() {
        context.read<AuthCubit>().changeXFIle(xFile);
      });
    }
  }

  Future<void> _getFromGallery() async {
    XFile? xFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (xFile != null) {
      setState(() {
        context.read<AuthCubit>().changeXFIle(xFile);
      });
    }
  }
}

