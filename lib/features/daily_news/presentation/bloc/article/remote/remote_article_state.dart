part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  const RemoteArticleState();
  @override
  List<Object> get props => [];
}

final class RemoteArticleInitial extends RemoteArticleState {
  const RemoteArticleInitial();
}

class RemoteArticleLoadingState extends RemoteArticleState {
  const RemoteArticleLoadingState();
}

class RemoteArticleLoadedState extends RemoteArticleState {
  RemoteArticleLoadedState({required this.articles});
  final List<ArticleEntity> articles;

  @override
  List<Object> get props => [articles];
}

class RemoteArticleErrorState extends RemoteArticleState {
  const RemoteArticleErrorState({required this.error});
  final DioException error;
  @override
  List<Object> get props => [error];
}
