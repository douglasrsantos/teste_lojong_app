// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VideoModel {
  int? id;
  String? name;
  String? description;
  String? url;
  String? url2;
  String? awsUrl;
  String? image;
  String? imageUrl;
  int? premium;
  int? order;

  VideoModel({
    this.name,
    this.description,
    this.url,
    this.url2,
    this.awsUrl,
    this.image,
    this.imageUrl,
    this.order,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'description': description,
      'url': url,
      'url2': url2,
      'aws_url': awsUrl,
      'image': image,
      'image_url': imageUrl,
      'order': order,
    };

    map.removeWhere((key, value) => value == null);

    return map;
  }

  factory VideoModel.fromMap(Map<String, dynamic> map) {
    return VideoModel(
      name: map['name'] != null ? map['name'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      url2: map['url2'] != null ? map['url2'] as String : null,
      awsUrl: map['aws_url'] != null ? map['aws_url'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      order: map['order'] != null ? map['order'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoModel.fromJson(String source) =>
      VideoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
