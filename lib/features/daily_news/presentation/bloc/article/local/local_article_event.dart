part of 'local_article_bloc.dart';

sealed class LocalArticleEvent extends Equatable {
  const LocalArticleEvent();

  @override
  List<Object?> get props => [];
}

class SaveArticleEvent extends LocalArticleEvent {
  const SaveArticleEvent(this.article);
  final ArticleEntity article;

  @override
  List<ArticleEntity?> get props => [article];
}

class DeleteSavedArticleEvent extends LocalArticleEvent {
  const DeleteSavedArticleEvent(this.article);
  final ArticleEntity article;

  @override
  List<ArticleEntity?> get props => [article];
}

class GetAllSavedArticlesEvent extends LocalArticleEvent {
  const GetAllSavedArticlesEvent();

  @override
  List<Object?> get props => [];
}
