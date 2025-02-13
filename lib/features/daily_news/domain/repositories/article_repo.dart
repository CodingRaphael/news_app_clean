import 'package:movie_app/core/res/data_state.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepo {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
