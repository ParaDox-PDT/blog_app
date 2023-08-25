import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_defualt_project/presentation/profile/profile_screen.dart';
import 'package:flutter_defualt_project/presentation/websites/website_screen.dart';

import '../../data/models/article/article_model.dart';
import '../../data/models/universal_data.dart';
import '../../data/repositories/auth_repository.dart';

part 'tab_box_state.dart';

class TabBoxCubit extends Cubit<TabBoxState> {
  TabBoxCubit({required this.authRepository}) : super(TabBoxHomeState()){getArticles();}

  final AuthRepository authRepository;

  List<Widget> screens = [
    const WebsitesScreen(),
    const ProfileScreen(),
  ];
  int currentScreenIndex=0;

  selectHomeState() {
    emit(TabBoxHomeState());
    currentScreenIndex=0;
  }

  selectProfileState() {
    emit(TabBoxProfileState());
    currentScreenIndex=1;
  }

  Future<void> getArticles() async {
    emit(TabBoxLoadingState());
    UniversalData universalData =
    await authRepository.getArticles();
    if (universalData.error.isEmpty) {
      emit(TabBoxSuccessState(articles: universalData.data as List<ArticleModel>));
    } else {
      emit(
        TabBoxErrorState(errorText: universalData.error),
      );
    }
  }
}
