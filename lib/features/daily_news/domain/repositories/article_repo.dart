import 'package:movie_app/core/res/data_state.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepo {
  //API methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();

  //Local DB Methods
  Future<void> saveArticle(ArticleEntity article);
  Future<List<ArticleEntity>> getAllSavedArticles();
  Future<void> deleteSavedArticle(ArticleEntity article);
}
