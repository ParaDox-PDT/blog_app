import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_defualt_project/data/models/websites/websites_model.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.websiteModel});

  final WebsiteModel websiteModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: ZoomTapAnimation(
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
                    baseUrl + websiteModel.image.substring(1),
                    errorWidget: (context, url, error) => Icon(Icons.language),
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
                          websiteModel.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(letterSpacing: 0.15.sp),
                        ),
                      ),
                      SizedBox(
                        width: 250.w,
                        child: Text(websiteModel.link,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium),
                      )
                    ],
                  )
                ],
              ),
              30.ph,
              Text(
                websiteModel.author,
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
