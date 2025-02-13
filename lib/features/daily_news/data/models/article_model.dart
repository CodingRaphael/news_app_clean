import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'articles', primaryKeys: ['id'])
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

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }
}
