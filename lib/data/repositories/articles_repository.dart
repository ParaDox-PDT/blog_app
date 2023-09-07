import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/data/models/universal_data.dart';
import 'package:flutter_defualt_project/data/network/open_api_service.dart';
import 'package:flutter_defualt_project/service/service_locator.dart';

class ArticlesRepository{
  ArticlesRepository( );

  Future<UniversalData> getArticles() async => getIt.get<OpenApiService>().getArticles();

  Future<UniversalData> createArticle(ArticleModel newArticle) async =>
      getIt.get<OpenApiService>().createArticle(articleModel: newArticle);
}