import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/data/models/article/article_model_fields.dart';
import 'package:flutter_defualt_project/data/models/universal_data.dart';
import 'package:flutter_defualt_project/data/repositories/articles_repository.dart';
import 'package:flutter_defualt_project/utils/constants.dart';

import '../../../data/models/status/form_status.dart';
import '../../../utils/ui_utils/loading_dialog.dart';

part 'articles_state.dart';

class ArticlesAddCubit extends Cubit<ArticleState> {
  ArticlesAddCubit(this.articlesRepository)
      : super(ArticleState(
            articleModel: ArticleModel(
                avatar: "",
                profession: "",
                username: "",
                userId: 0,
                title: "",
                description: "",
                image: "",
                addDate: "",
                artId: 0,
                likes: "",
                views: "",
                hashtag: ""),
            articles: []));

  final ArticlesRepository articlesRepository;

  Future<void> addArticle(BuildContext context)async{
    emit(state.copyWith(
      status: FormStatus.loading,
      statusText: "",
    ));

    showLoading(context: context);
    UniversalData response =
    await articlesRepository.createArticle(state.articleModel);
    if (context.mounted) hideLoading(context: context);
    if (response.error.isEmpty) {
      emit(
        state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextConstants.articleAdd,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: FormStatus.failure,
          statusText: response.error,
        ),
      );
    }
  }


  updateArticleField({
    required ArticleModelFields articleModelFields,
    required dynamic value,
  }) {
    ArticleModel currentArticle = state.articleModel;

    switch (articleModelFields) {
      case ArticleModelFields.hashtag:
        {
          currentArticle = currentArticle.copyWith(hashtag: value as String);
          break;
        }
      case ArticleModelFields.views:
        {
          currentArticle = currentArticle.copyWith(views: value as String);
          break;
        }
      case ArticleModelFields.likes:
        {
          currentArticle = currentArticle.copyWith(likes: value as String);
          break;
        }
      case ArticleModelFields.addDate:
        {
          currentArticle = currentArticle.copyWith(addDate:  value as String);
          break;
        }
      case ArticleModelFields.description:
        {
          currentArticle = currentArticle.copyWith(description: value as String);
          break;
        }
      case ArticleModelFields.image:
        {
          currentArticle = currentArticle.copyWith(image: value as String);
          break;
        }
      case ArticleModelFields.title:
        {
          currentArticle = currentArticle.copyWith(title: value as String);
          break;
        }
      case ArticleModelFields.userId:
        {
          currentArticle = currentArticle.copyWith(userId: value as int);
          break;
        }
      case ArticleModelFields.username:
        {
          currentArticle = currentArticle.copyWith(username: value as String);
          break;
        }
      case ArticleModelFields.profession:
        {
          currentArticle = currentArticle.copyWith(profession: value as String);
          break;
        }
      case ArticleModelFields.avatar:
        {
          currentArticle = currentArticle.copyWith(avatar: value as String);
          break;
        }
    }

    debugPrint("WEBSITE: ${currentArticle.toString()}");

    emit(state.copyWith(
      articleModel: currentArticle,
      status: FormStatus.pure,
    ));
  }
}
