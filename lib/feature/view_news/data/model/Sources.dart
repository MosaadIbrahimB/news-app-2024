import 'dart:convert';

/// id : "abc-news"
/// name : "ABC News"
/// description : "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com."
/// url : "https://abcnews.go.com"
/// category : "general"
/// language : "en"
/// country : "us"

Sources sourcesFromJson(String str) => Sources.fromJson(json.decode(str));
String sourcesToJson(Sources data) => json.encode(data.toJson());
class Sources {
  Sources({
      this.id, 
      this.name, 
      this.description, 
      this.url, 
      this.category, 
      this.language, 
      this.country,});

  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['url'] = url;
    map['category'] = category;
    map['language'] = language;
    map['country'] = country;
    return map;
  }

}