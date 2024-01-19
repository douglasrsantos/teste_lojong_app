// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:teste_lojong/app/models/quote_model.dart';

class QuotesListModel {
  bool? hasMore;
  int? currentPage;
  int? lastPage;
  int? nextPage;
  List<QuoteModel>? quotes;

  QuotesListModel({
    this.hasMore,
    this.currentPage,
    this.lastPage,
    this.nextPage,
    this.quotes,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'has_more': hasMore,
      'current_page': currentPage,
      'last_page': lastPage,
      'next_page': nextPage,
      'list': quotes?.map((x) => x.toMap()).toList(),
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory QuotesListModel.fromMap(Map<String, dynamic> map) {
    return QuotesListModel(
      hasMore: map['has_more'] != null ? map['has_more'] as bool : null,
      currentPage:
          map['current_page'] != null ? map['current_page'] as int : null,
      lastPage: map['last_page'] != null ? map['last_page'] as int : null,
      nextPage: map['next_page'] != null ? map['next_page'] as int : null,
      quotes: map['list'] != null
          ? List<QuoteModel>.from(
              (map['list'] as List).map<QuoteModel?>(
                (x) => QuoteModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuotesListModel.fromJson(String source) =>
      QuotesListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
