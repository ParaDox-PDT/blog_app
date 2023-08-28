import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/data/models/universal_data.dart';
import 'package:flutter_defualt_project/data/repositories/articles_repository.dart';
import 'package:flutter_defualt_project/utils/constants.dart';

import '../../../data/models/status/form_status.dart';
import '../../../utils/ui_utils/loading_dialog.dart';

part 'article_get_state.dart';

class ArticleGetCubit extends Cubit<ArticleFetchState> {
  ArticleGetCubit(this.articlesRepository) : super(const ArticleFetchState(articles: []));

  final ArticlesRepository articlesRepository;

  getArticles(BuildContext context) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "",
      ),
    );
    UniversalData response = await articlesRepository.getArticles();
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextConstants.gotAllArticle,
          articles: response.data as List<ArticleModel>,
        ),
      );
    } else {
      emit(state.copyWith(
        status: FormStatus.failure,
        statusText: response.error,
      ));
    }
  }
}
