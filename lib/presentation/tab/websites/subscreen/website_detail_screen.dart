import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/websites/websites_model.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/constants.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class WebsiteDetailScreen extends StatefulWidget {
  const WebsiteDetailScreen({super.key, required this.websiteModel});

  final WebsiteModel websiteModel;

  @override
  State<WebsiteDetailScreen> createState() => _WebsiteDetailScreenState();
}

class _WebsiteDetailScreenState extends State<WebsiteDetailScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.c_005FEE,
        title: Text(
          widget.websiteModel.author,
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
            CachedNetworkImage(
              imageUrl: baseUrl + widget.websiteModel.image.substring(1),
              height: 300.h,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>  Icon(Icons.error,size: 40.sp,),
            ),
            20.ph,
            Text(
              widget.websiteModel.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 26.sp),
            ),
            16.ph,
            Row(
              children: [
                Text(
                  "Link: ",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 18.sp, color: AppColors.textColor),
                ),
                Linkify(
                  onOpen: (link) async {
                    if (!await launchUrl(Uri.parse(link.url))) {
                      throw Exception('Could not launch ${link.url}');
                    }
                  },
                  text: widget.websiteModel.link,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 18.sp, color: Colors.red),
                  linkStyle:Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 18.sp, color: AppColors.c_005FEE),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
