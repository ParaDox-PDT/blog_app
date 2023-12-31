import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_defualt_project/cubits/website/website_cubit.dart';
import 'package:flutter_defualt_project/data/models/websites/websites_fields_keys.dart';
import 'package:flutter_defualt_project/presentation/widgets/global_post_button.dart';
import 'package:flutter_defualt_project/utils/colors.dart';
import 'package:flutter_defualt_project/utils/extension.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';



class AddWebsiteScreen extends StatefulWidget {
  const AddWebsiteScreen({super.key});

  @override
  State<AddWebsiteScreen> createState() => _AddWebsiteScreenState();
}

class _AddWebsiteScreenState extends State<AddWebsiteScreen> {

  ImagePicker picker = ImagePicker();

  late WebsiteCubit bloc ;

  @override
  void initState() {
    bloc = BlocProvider.of<WebsiteCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<WebsiteCubit>(context).updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.image, value: "");
              BlocProvider.of<WebsiteCubit>(context).updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.name, value: "");
              BlocProvider.of<WebsiteCubit>(context).updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.link, value: "");
              BlocProvider.of<WebsiteCubit>(context).updateWebsiteField(
                  fieldKey: WebsiteFieldKeys.hashtag, value: "");
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.c_005FEE,
        title: Text(
          "Add a Website",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.white),
        ),
      ),
      body: BlocConsumer<WebsiteCubit, WebsiteState>(
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
                          context.read<WebsiteCubit>().updateWebsiteField(
                              fieldKey: WebsiteFieldKeys.name,
                              value: value);
                        },
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            hintText: "Website's name",
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
                          context.read<WebsiteCubit>().updateWebsiteField(
                              fieldKey:
                              WebsiteFieldKeys.link,
                              value: value);
                        },
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            hintText: "Link",
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
                          context.read<WebsiteCubit>().updateWebsiteField(
                              fieldKey: WebsiteFieldKeys.hashtag,
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
                          child: state.websiteModel.image.isEmpty
                              ? const Text(
                            "Image Not Selected",
                            style: TextStyle(color: Colors.black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                              : Image.file(
                            File(state.websiteModel.image),
                          ),
                        ),
                      ),
                    ),
                    30.ph,
                    GlobalPostButton(
                        text: "Post",
                        onTap: () {
                          if (state.canAddWebsite()) {
                            context
                                .read<WebsiteCubit>()
                                .createWebsite();
                            context.read<WebsiteCubit>().updateWebsiteField(
                                fieldKey: WebsiteFieldKeys.image, value: "");
                            context.read<WebsiteCubit>().updateWebsiteField(
                                fieldKey: WebsiteFieldKeys.name, value: "");
                            context.read<WebsiteCubit>().updateWebsiteField(
                                fieldKey: WebsiteFieldKeys.link, value: "");
                            context.read<WebsiteCubit>().updateWebsiteField(
                                fieldKey: WebsiteFieldKeys.hashtag, value: "");
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
        context.read<WebsiteCubit>().updateWebsiteField(
            fieldKey: WebsiteFieldKeys.image, value: xFile.path);
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
        context.read<WebsiteCubit>().updateWebsiteField(
            fieldKey: WebsiteFieldKeys.image, value: xFile.path);
      });
    }
  }
}