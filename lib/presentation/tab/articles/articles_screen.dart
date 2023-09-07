import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/articles/article_get_cubit/article_get_cubit.dart';
import 'package:flutter_defualt_project/cubits/tab_box/tab_box_cubit.dart';
import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/data/models/status/form_status.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/presentation/tab/articles/widgets/floating_button.dart';
import 'package:flutter_defualt_project/presentation/tab/articles/widgets/list_item.dart';
import 'package:flutter_defualt_project/utils/icons.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    Future.microtask(
        () => BlocProvider.of<ArticleGetCubit>(context).getArticles(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Articles",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset(AppIcons.search),
          // )
        ],
      ),
      body: BlocConsumer<ArticleGetCubit, ArticleFetchState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return Center(child: Lottie.asset(AppImages.loading2));
          }
          if (state is TabBoxLoadingState) {
            return Center(child: Lottie.asset(AppImages.loading3));
          }
          return SizedBox(
            width: double.infinity,
            child: ListView(
              children: [
                ...List.generate(state.articles.length, (index) {
                  ArticleModel articleModel = state.articles[index];
                  return ListItem(
                    articleModel: articleModel,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.articleDetail,
                          arguments: articleModel);
                    },
                  );
                })
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.status == FormStatus.failure) {
            showErrorMessage(
              message: state.statusText,
              context: context,
            );
          }
        },
      ),
      floatingActionButton: FloatingButton(onTap: () {
        Navigator.pushNamed(context, RouteNames.articleAdd);
      }),
    );
  }
}
