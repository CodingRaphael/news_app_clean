part of 'local_article_bloc.dart';

sealed class LocalArticleState extends Equatable {
  const LocalArticleState();
}

final class LocalArticleInitial extends LocalArticleState {
  @override
  List<Object> get props => [];
}

class LocalArticleLoadingState extends LocalArticleState {
  const LocalArticleLoadingState();

  @override
  List<Object> get props => [];
}

class LocalArticleLoadedState extends LocalArticleState {
  const LocalArticleLoadedState(this.articles);
  final List<ArticleEntity> articles;

  @override
  List<Object> get props => [articles];
}

class LocalArticleErrorState extends LocalArticleState {
  const LocalArticleErrorState(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
