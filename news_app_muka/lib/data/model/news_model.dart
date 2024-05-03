class NewsModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final SourceModel source;
  const NewsModel({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.source,
  });
  factory NewsModel.fromJson(Map json) => NewsModel(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt'],
        content: json['content'],
        source: SourceModel.fromJson(json['source']),
      );
  Map<String, dynamic> toJson() => {
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'source': source.toJson(),
        'publishedAt': publishedAt,
        'content': content,
      };
}

class SourceModel {
  final String? id;
  final String name;
  SourceModel({
    required this.id,
    required this.name,
  });
  factory SourceModel.fromJson(Map json) =>
      SourceModel(id: json['id'], name: json['name']);
  Map<String, dynamic> toJson() => {
        'name': name,   
        'id': id,
      };
}
