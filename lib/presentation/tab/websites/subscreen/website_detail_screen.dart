import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/websites/websites_model.dart';
import 'package:flutter_defualt_project/utils/colors.dart';

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
        title: Text(widget.websiteModel.author,style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: AppColors.white),),
      ),
    );
  }
}
