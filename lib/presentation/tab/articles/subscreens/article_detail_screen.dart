import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailScreen extends StatefulWidget {
  const ArticleDetailScreen({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  State<ArticleDetailScreen> createState() => _ArticleDetailScreenState();
}

class _ArticleDetailScreenState extends State<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_005FEE,
        title: Text(
          "Author: ${widget.articleModel.username}",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 16.h),
        child: ListView(
          children: [
            Text(
              widget.articleModel.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 26.sp),
            ),
            16.ph,
            Text(
              widget.articleModel.description,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 18.sp, color: AppColors.textColor),
            )
          ],
        ),
      ),
    );
  }
}
