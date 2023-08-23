import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/tab_box/tab_box_cubit.dart';
import 'package:flutter_defualt_project/utils/colors.dart';

class TabBoxScreen extends StatefulWidget {
  const TabBoxScreen({super.key});

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();
}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<TabBoxCubit, TabBoxState>(
          builder: (context, state) {
            return context
                .watch<TabBoxCubit>()
                .screens[context.watch<TabBoxCubit>().currentScreenIndex];
          },
          listener: (context, state) {
            if (state is TabBoxHomeState) {
              context.read<TabBoxCubit>().getArticles();
              setState(() {
                activeIndex = 0;
              });
            }
            if (state is TabBoxProfileState) {
              setState(() {
                activeIndex = 1;
              });
            }
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: activeIndex,
          onTap: (value) {
            activeIndex == 0
                ? context.read<TabBoxCubit>().selectProfileState()
                : context.read<TabBoxCubit>().selectHomeState();
            setState(() {
              activeIndex = value;
            });
          },
          backgroundColor: AppColors.c_E7F0FE,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ));
  }
}
