import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/website/website_cubit.dart';
import 'package:flutter_defualt_project/data/models/status/form_status.dart';
import 'package:flutter_defualt_project/data/models/websites/websites_model.dart';
import 'package:flutter_defualt_project/presentation/app_routes.dart';
import 'package:flutter_defualt_project/presentation/tab/websites/widgets/list_item.dart';
import 'package:flutter_defualt_project/utils/images.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:lottie/lottie.dart';

import '../articles/widgets/floating_button.dart';

class WebsitesScreen extends StatefulWidget {
  const WebsitesScreen({super.key});

  @override
  State<WebsitesScreen> createState() => _WebsitesScreenState();
}

class _WebsitesScreenState extends State<WebsitesScreen> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    Future.microtask(
        () => BlocProvider.of<WebsiteCubit>(context).getWebsites(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sites screen",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: const [
          // IconButton(
          //   onPressed: () {
          //     Navigator.pushNamed(context, RouteNames.addWebsite);
          //   },
          //   icon: const Icon(Icons.add),color: AppColors.c_005FEE,
          // )
        ],
      ),
      body: BlocConsumer<WebsiteCubit, WebsiteState>(
        builder: (context, state) {
          if (state.statusText == "") {
            return Center(child: Lottie.asset(AppImages.loading2));
          }
          return SizedBox(
            width: double.infinity,
            child: ListView(
              children: [
                ...List.generate(state.websites.length, (index) {
                  WebsiteModel websiteModel = state.websites[index];
                  return ListItem(
                    websiteModel: websiteModel,
                    onTap: () {
                      Navigator.pushNamed(context, RouteNames.websiteDetail,
                          arguments: websiteModel);
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
          if (state.statusText == "website_added") {
            BlocProvider.of<WebsiteCubit>(context).getWebsites(context);
          }
        },
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
