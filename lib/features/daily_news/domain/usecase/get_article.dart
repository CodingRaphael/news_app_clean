import 'package:movie_app/core/res/data_state.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/domain/repositories/article_repo.dart';

class GetArticle extends UseCaseWithoutParams {
  GetArticle(this._repository);

  final ArticleRepo _repository;

  @override
  Future<DataState<List<ArticleEntity>>> call() {
    return _repository.getNewsArticles();
  }
}
