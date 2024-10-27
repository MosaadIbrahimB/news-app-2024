import 'dart:convert';

import 'package:news_app_2024/feature/view_news/data/model/Sources.dart';

ResponseNews respocesArticlesFromJson(String str) => ResponseNews.fromJson(json.decode(str));
String respocesArticlesToJson(ResponseNews data) => json.encode(data.toJson());


class ResponseNews {
  String? status;
  int? totalResults;
  List<Articles>? articles;



  ResponseNews({
      this.status, 
      this.totalResults, 
      this.articles,});

  ResponseNews.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));
String articlesToJson(Articles data) => json.encode(data.toJson());

class Articles {
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
      this.source,
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Sources.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}



Sources sourceFromJson(String str) => Sources.fromJson(json.decode(str));
String sourceToJson(Sources data) => json.encode(data.toJson());

// class Source {
//   Source({
//       this.id,
//       this.name,});
//
//   Source.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//   }
//   String? id;
//   String? name;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     return map;
//   }
//
// }