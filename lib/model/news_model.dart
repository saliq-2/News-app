// To parse this JSON data, do
//
//     final newModel = newModelFromJson(jsonString);

import 'dart:convert';

NewModel newModelFromJson(String str) => NewModel.fromJson(json.decode(str));

String newModelToJson(NewModel data) => json.encode(data.toJson());

class NewModel {
  int totalArticles;
  List<Article> articles;

  NewModel({
    required this.totalArticles,
    required this.articles,
  });

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
    totalArticles: json["totalArticles"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalArticles": totalArticles,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  String title;
  String description;
  String content;
  String url;
  String image;
  DateTime publishedAt;
  Source source;

  Article({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.image,
    required this.publishedAt,
    required this.source,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    title: json["title"],
    description: json["description"],
    content: json["content"],
    url: json["url"],
    image: json["image"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    source: Source.fromJson(json["source"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "content": content,
    "url": url,
    "image": image,
    "publishedAt": publishedAt.toIso8601String(),
    "source": source.toJson(),
  };
}

class Source {
  String name;
  String url;

  Source({
    required this.name,
    required this.url,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
