import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/constants.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.articleModel, required this.onTap});
  
  final ArticleModel articleModel;
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: ZoomTapAnimation(
        onTap: onTap,
        child: Container(
          width: 344.w,
          height: 176.h,
          padding: EdgeInsets.symmetric(
              horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(0.6),
                  blurRadius: 2)
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                    "$baseUrlForImage${articleModel.avatar}",
                    width: 40.w,
                    height: 40.w,
                  ),
                  16.pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          articleModel.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(letterSpacing: 0.15.sp),
                        ),
                      ),
                      Text(articleModel.username,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium)
                    ],
                  )
                ],
              ),
              30.ph,
              Text(
                articleModel.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(
                    color: AppColors.passiveTextColor,
                    fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
