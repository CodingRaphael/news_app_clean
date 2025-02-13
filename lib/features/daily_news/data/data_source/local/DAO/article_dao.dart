import 'package:floor/floor.dart';
import 'package:movie_app/features/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @Insert()
  Future<void> insertArticle(ArticleModel article);

  @Query('SELECT * FROM articles')
  Future<List<ArticleModel>> getAllArticles();

  @delete
  Future<void> deleteArticle(ArticleModel article);
}
