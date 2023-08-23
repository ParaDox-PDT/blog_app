import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/tab_box/tab_box_cubit.dart';
import 'package:flutter_defualt_project/presentation/home/widgets/floating_button.dart';
import 'package:flutter_defualt_project/presentation/home/widgets/list_item.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../data/models/article/article_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> articles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppIcons.search),
          )
        ],
      ),
      body: BlocConsumer<TabBoxCubit, TabBoxState>(
        builder: (context, state) {
          if (state is TabBoxLoadingState) {
            return Center(child: Lottie.asset(AppImages.loading3));
          }
          return SizedBox(
            width: double.infinity,
            child: ListView(
              children: [
                ...List.generate(articles.length, (index) {
                  ArticleModel articleModel = articles[index];
                  return ListItem(articleModel: articleModel);
                })
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is TabBoxErrorState) {
            showErrorMessage(message: state.errorText, context: context);
          }
          if (state is TabBoxSuccessState) {
            setState(() {
              articles = state.articles;
            });
          }
        },
      ),
      floatingActionButton:const FloatingButton(),
    );
  }
}
