import 'package:movie_app/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  ArticleModel({
    int? id,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
            id: id,
            author: author,
            content: content,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt);

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'] as String,
      title: json['title'] as String ?? "",
      description: json['description'] as String ?? "",
      url: json['url'] as String ?? "",
      urlToImage: json['urlToImage'] as String ?? "",
      publishedAt: json['publishedAt'] as String ?? "",
      content: json['content'] as String ?? "",
    );
  }
}
