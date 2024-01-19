// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:teste_lojong/app/models/article_model.dart';

class ArticleListModel {
  bool? hasMore;
  int? currentPage;
  int? lastPage;
  int? nextPage;
  List<ArticleModel>? articles;

  ArticleListModel({
    this.hasMore,
    this.currentPage,
    this.lastPage,
    this.nextPage,
    this.articles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'has_more': hasMore,
      'current_page': currentPage,
      'last_page': lastPage,
      'next_page': nextPage,
      'list': articles?.map((x) => x.toMap()).toList(),
    };
  }

  factory ArticleListModel.fromMap(Map<String, dynamic> map) {
    return ArticleListModel(
      hasMore: map['has_more'] != null ? map['has_more'] as bool : null,
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      lastPage: map['last_page'] != null ? map['last_page'] as int : null,
      nextPage: map['next_page'] != null ? map['next_page'] as int : null,
      articles: map['list'] != null
          ? List<ArticleModel>.from(
              (map['list'] as List).map<ArticleModel?>(
                (x) => ArticleModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleListModel.fromJson(String source) =>
      ArticleListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
