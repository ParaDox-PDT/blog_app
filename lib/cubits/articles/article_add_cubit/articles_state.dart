part of 'articles_cubit.dart';

class ArticleState extends Equatable {
  final String statusText;
  final ArticleModel articleModel;
  ArticleModel? articleDetail;
  final List<ArticleModel> articles;
  final FormStatus status;

  ArticleState({
    required this.articleModel,
    this.articleDetail,
    this.statusText = "",
    this.status = FormStatus.pure,
    required this.articles,
  });

  ArticleState copyWith({
    String? statusText,
    ArticleModel? articleModel,
    ArticleModel? articleDetail,
    List<ArticleModel>? articles,
    FormStatus? status,
  }) =>
      ArticleState(
        articleDetail: articleDetail ?? this.articleDetail,
        articleModel: articleModel ?? this.articleModel,
        articles: articles ?? this.articles,
        statusText: statusText ?? this.statusText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
    articleModel,
    articles,
    statusText,
    status,
    articleDetail,
  ];

  bool canAddWebsite() {
    if (articleModel.image.isEmpty) return false;
    if (articleModel.hashtag.isEmpty) return false;
    if (articleModel.username.isEmpty) return false;
    if (articleModel.description.isEmpty) return false;
    if (articleModel.title.isEmpty) return false;
    if (articleModel.avatar.isEmpty) return false;
    if (articleModel.views.isEmpty) return false;
    if (articleModel.likes.isEmpty) return false;
    if (articleModel.addDate.isEmpty) return false;
    if (articleModel.profession.isEmpty) return false;
    return true;
  }
}