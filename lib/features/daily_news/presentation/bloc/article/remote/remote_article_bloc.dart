import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/res/data_state.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/domain/usecase/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticle _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticleInitial()) {
    on<RemoteArticleEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetRemoteArticleEvent>(_getArticleUseCaseHandler);
  }

  void _getArticleUseCaseHandler(
      GetRemoteArticleEvent event, Emitter<RemoteArticleState> emit) async {
    emit(RemoteArticleLoadingState());
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleLoadedState(articles: dataState.data!));
    } else if (dataState is DataFailed) {
      print(dataState.error);
      emit(RemoteArticleErrorState(error: dataState.error!));
    }
  }
}
