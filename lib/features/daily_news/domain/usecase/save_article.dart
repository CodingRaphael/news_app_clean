import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/domain/repositories/article_repo.dart';

class SaveArticle extends UseCaseWithParams<void, ArticleEntity> {
  SaveArticle(this._repository);

  final ArticleRepo _repository;

  @override
  Future<void> call(ArticleEntity? params) {
    return _repository.saveArticle(params!);
  }
}
