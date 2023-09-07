import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/articles/article_add_cubit/articles_cubit.dart';
import 'package:flutter_defualt_project/data/models/article/article_model_fields.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_post_button.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class ArticleAddScreen extends StatefulWidget {
  const ArticleAddScreen({super.key});

  @override
  State<ArticleAddScreen> createState() => _ArticleAddScreenState();
}

class _ArticleAddScreenState extends State<ArticleAddScreen> {
  TextEditingController topicController = TextEditingController();
  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<ArticlesAddCubit>(context).updateArticleField(
                  articleModelFields: ArticleModelFields.image, value: "");
              BlocProvider.of<ArticlesAddCubit>(context).updateArticleField(
                  articleModelFields: ArticleModelFields.title, value: "");
              BlocProvider.of<ArticlesAddCubit>(context).updateArticleField(
                  articleModelFields: ArticleModelFields.description,
                  value: "");
              BlocProvider.of<ArticlesAddCubit>(context).updateArticleField(
                  articleModelFields: ArticleModelFields.hashtag, value: "");
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.c_005FEE,
        title: Text(
          "Post a Article",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.white),
        ),
      ),
      body: BlocConsumer<ArticlesAddCubit, ArticleState>(
        builder: (context, state) {
          return ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.white,
                      ),
                      width: 326.w,
                      height: 54.h,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          context.read<ArticlesAddCubit>().updateArticleField(
                              articleModelFields: ArticleModelFields.title,
                              value: value);
                        },
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            suffixIcon: SizedBox(
                              width: 20.sp,
                            ),
                            hintText: "Topic",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.textColor),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5)))),
                      ),
                    ),
                    18.ph,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.white,
                      ),
                      width: 326.w,
                      height: 368.h,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        maxLines: 100,
                        onChanged: (value) {
                          context.read<ArticlesAddCubit>().updateArticleField(
                              articleModelFields:
                                  ArticleModelFields.description,
                              value: value);
                        },
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            hintText: "Article",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.textColor),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5)))),
                      ),
                    ),
                    18.ph,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.white,
                      ),
                      width: 326.w,
                      height: 54.h,
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          context.read<ArticlesAddCubit>().updateArticleField(
                              articleModelFields: ArticleModelFields.hashtag,
                              value: value);
                        },
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            suffixIcon: SizedBox(
                              width: 20.sp,
                            ),
                            hintText: "Hashtag",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.textColor),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: AppColors.black.withOpacity(0.5)))),
                      ),
                    ),
                    20.ph,
                    ZoomTapAnimation(
                      onTap: () {
                        showBottomSheetDialog();
                      },
                      child: Container(
                        padding: EdgeInsets.all(14.sp),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                                width: 1, color: AppColors.textColor),
                            color: Colors.white),
                        child: Center(
                          child: state.articleModel.image.isEmpty
                              ? const Text(
                                  "Image Not Selected",
                                  style: TextStyle(color: Colors.black),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : Image.file(
                                  File(state.articleModel.image),
                                ),
                        ),
                      ),
                    ),
                    30.ph,
                    GlobalPostButton(
                        text: "Post",
                        onTap: () {
                          context.read<ArticlesAddCubit>().updateArticleField(
                              articleModelFields: ArticleModelFields.addDate,
                              value: DateTime.now().toString());
                          if (state.canAddArticle()) {
                            context
                                .read<ArticlesAddCubit>()
                                .addArticle(context);
                            context.read<ArticlesAddCubit>().updateArticleField(
                                articleModelFields: ArticleModelFields.image, value: "");
                            context.read<ArticlesAddCubit>().updateArticleField(
                                articleModelFields: ArticleModelFields.title, value: "");
                            context.read<ArticlesAddCubit>().updateArticleField(
                                articleModelFields: ArticleModelFields.description,
                                value: "");
                            context.read<ArticlesAddCubit>().updateArticleField(
                                articleModelFields: ArticleModelFields.hashtag, value: "");
                            Navigator.pop(context);
                          } else {
                            showErrorMessage(
                                message: "Field don't full", context: context);
                          }
                        })
                  ],
                ),
              )
            ],
          );
        },
        listener: (context, state) {},
      ),
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
        context.read<ArticlesAddCubit>().updateArticleField(
            articleModelFields: ArticleModelFields.image, value: xFile.path);
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
        context.read<ArticlesAddCubit>().updateArticleField(
            articleModelFields: ArticleModelFields.image, value: xFile.path);
      });
    }
  }
}
