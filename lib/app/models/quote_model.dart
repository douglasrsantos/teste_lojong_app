import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QuoteModel {
  int? id;
  String? text;
  String? author;
  int? order;

  QuoteModel({
    this.id,
    this.text,
    this.author,
    this.order,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'text': text,
      'author': author,
      'order': order,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      id: map['id'] != null ? map['id'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      order: map['order'] != null ? map['order'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuoteModel.fromJson(String source) =>
      QuoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
