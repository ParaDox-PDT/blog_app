part of 'article_get_cubit.dart';

class ArticleFetchState extends Equatable {
  final String statusText;
  final ArticleModel? articleModelDetail;
  final List<ArticleModel> articles;
  final FormStatus status;

  const ArticleFetchState({
    this.articleModelDetail,
    this.statusText = "",
    this.status = FormStatus.pure,
    required this.articles,
  });

  ArticleFetchState copyWith({
    String? statusText,
    ArticleModel? articleModelDetail,
    List<ArticleModel>? articles,
    FormStatus? status,
  }) =>
      ArticleFetchState(
        articleModelDetail: articleModelDetail ?? this.articleModelDetail,
        articles: articles ?? this.articles,
        statusText: statusText ?? this.statusText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [
    articles,
    statusText,
    status,
    articleModelDetail,
  ];
}

