import 'package:flutter_defualt_project/data/models/article/article_model.dart';
import 'package:flutter_defualt_project/data/models/universal_data.dart';
import 'package:flutter_defualt_project/data/network/api_service.dart';

class ArticlesRepository{
  final ApiService apiService;
  ArticlesRepository({required this.apiService});

  Future<UniversalData> getArticles() async => apiService.getArticles();

  Future<UniversalData> createArticle(ArticleModel newArticle) async =>
      apiService.createArticle(articleModel: newArticle);
}