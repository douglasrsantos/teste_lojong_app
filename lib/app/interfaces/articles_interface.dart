import 'package:teste_lojong/app/models/article_model.dart';
import 'package:teste_lojong/app/models/articles_list_model.dart';

abstract class IArticles {
  Future<ArticleListModel> getAllArticles({int? page});
  Future<ArticleModel> getArticleById({required int articleId});
}
