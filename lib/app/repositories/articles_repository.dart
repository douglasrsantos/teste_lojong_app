import 'dart:async';

import 'package:dio/dio.dart';
import 'package:teste_lojong/app/core/services/initialize_dio.dart';
import 'package:teste_lojong/app/interfaces/articles_interface.dart';
import 'package:teste_lojong/app/models/article_model.dart';
import 'package:teste_lojong/app/models/articles_list_model.dart';

class ArticlesRepository implements IArticles {
  final Dio _dio;

  ArticlesRepository(this._dio) {
    _init();
  }

  _init() async {
    InitializeDio.initializeDioOptions(_dio, 'articles-cache');
  }

  @override
  Future<ArticleListModel> getAllArticles({int? page}) async {
    final result = await _dio.get(
      'articles2',
      data: {
        "page": page,
      },
      options: Options(
        headers: {
          'Authorization':
              'Bearer O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf',
        },
      ),
    );

    return ArticleListModel.fromMap(result.data);
  }

  @override
  Future<ArticleModel> getArticleById({required int articleId}) async {
    final result = await _dio.get(
      'article-content',
      data: {
        'articleid': articleId,
      },
      options: Options(
        headers: {
          'Authorization':
              'Bearer O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf',
        },
      ),
    );

    return ArticleModel.fromMap(result.data);
  }
}
