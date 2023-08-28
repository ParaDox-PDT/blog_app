import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_defualt_project/presentation/tab/articles/articles_screen.dart';


import '../../data/models/article/article_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../../presentation/tab/profile/profile_screen.dart';
import '../../presentation/tab/websites/website_screen.dart';

part 'tab_box_state.dart';

class TabBoxCubit extends Cubit<TabBoxState> {
  TabBoxCubit({required this.authRepository}) : super(TabBoxHomeState());

  final AuthRepository authRepository;

  List<Widget> screens = [

    const WebsitesScreen(),
    const ArticlesScreen(),
    const ProfileScreen(),
  ];
  int currentScreenIndex=0;

  selectHomeState() {
    emit(TabBoxHomeState());
    currentScreenIndex=0;
  }

  selectArticleState() {
    emit(TabBoxArticleState());
    currentScreenIndex=1;
  }

  selectProfileState() {
    emit(TabBoxProfileState());
    currentScreenIndex=2;
  }


}
