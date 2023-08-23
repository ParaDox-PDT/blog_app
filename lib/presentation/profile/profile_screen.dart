import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/auth/auth_cubit.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/icons.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logOutUser();
              Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
            },
            icon: SvgPicture.asset(AppIcons.logOut),
          )
        ],
      ),
    );
  }
}
