part of 'remote_article_bloc.dart';

sealed class RemoteArticleEvent extends Equatable {
  const RemoteArticleEvent();
  @override
  List<Object?> get props => [];
}

class GetRemoteArticleEvent extends RemoteArticleEvent {
  const GetRemoteArticleEvent();
}
