import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArticleModel {
  int? id;
  String? text;
  String? title;
  String? imageUrl;
  String? authorName;
  String? url;
  int? premium;
  int? order;
  String? fullText;
  String? authorImage;
  String? authorDescription;
  String? image;

  ArticleModel({
    this.id,
    this.text,
    this.title,
    this.imageUrl,
    this.authorName,
    this.url,
    this.premium,
    this.order,
    this.fullText,
    this.authorImage,
    this.authorDescription,
    this.image,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'text': text,
      'title': title,
      'image_url': imageUrl,
      'author_name': authorName,
      'url': url,
      'premium': premium,
      'order': order,
      'full_text': fullText,
      'author_image': authorImage,
      'author_description': authorDescription,
      'image': image,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      id: map['id'] != null ? map['id'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      authorName:
          map['author_name'] != null ? map['author_name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      premium: map['premium'] != null ? map['premium'] as int : null,
      order: map['order'] != null ? map['order'] as int : null,
      fullText: map['full_text'] != null ? map['full_text'] as String : null,
      authorImage:
          map['author_image'] != null ? map['author_image'] as String : null,
      authorDescription: map['author_description'] != null
          ? map['author_description'] as String
          : null,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
