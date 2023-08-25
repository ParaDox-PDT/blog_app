import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:lottie/lottie.dart';

import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/profile/profile_cubit.dart';
import '../../utils/constants.dart';
import '../../utils/images.dart';
import '../../utils/ui_utils/custom_circular.dart';
import '../../utils/ui_utils/error_message_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  _init() async {
    Future.microtask(
            () => BlocProvider.of<ProfileCubit>(context).getUserData());
  }


  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Profile",style: Theme.of(context).textTheme.titleLarge,),
        elevation: 6,
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOutUser();
                Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
              },
              icon: const Icon(Icons.logout),color: AppColors.c_005FEE,)
        ],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return Center(child: Lottie.asset(AppImages.loading2));
          }
          if (state is ProfileSuccessState) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  20.ph,
                  Image.network(
                    baseUrl + state.userModel.avatar.substring(1),
                    width: 200,
                  ),
                  ListTile(
                    title: Text(
                      state.userModel.username,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      state.userModel.email,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      state.userModel.role,
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      state.userModel.contact,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      state.userModel.id.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(
                      state.userModel.gender,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Text("ERROR");
        },
        listener: (context, state) {
          if (state is ProfileErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      ),
    );
  }
}