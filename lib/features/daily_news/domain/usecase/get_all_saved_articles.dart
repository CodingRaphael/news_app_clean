import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/domain/repositories/article_repo.dart';

class GetAllSavedArticles extends UseCaseWithoutParams {
  GetAllSavedArticles(this._repository);

  final ArticleRepo _repository;

  @override
  Future<List<ArticleEntity>> call() {
    return _repository.getAllSavedArticles();
  }
}
