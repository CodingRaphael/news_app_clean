import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/domain/usecase/delete_saved_article.dart';
import 'package:movie_app/features/daily_news/domain/usecase/get_all_saved_articles.dart';
import 'package:movie_app/features/daily_news/domain/usecase/save_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetAllSavedArticles _getAllSavedArticles;
  final SaveArticle _saveArticle;
  final DeleteSavedArticle _deleteSavedArticle;
  LocalArticleBloc(
      this._getAllSavedArticles, this._saveArticle, this._deleteSavedArticle)
      : super(LocalArticleInitial()) {
    on<LocalArticleEvent>((event, emit) {});
    on<GetAllSavedArticlesEvent>((event, emit) {
      onGetSavedArticles(emit);
    });
    on<SaveArticleEvent>((event, emit) {
      onSaveArticle(event.article, emit);
    });
    on<DeleteSavedArticleEvent>((event, emit) {
      onDeleteArticle(event.article, emit);
    });
  }

  void onGetSavedArticles(Emitter<LocalArticleState> emit) async {
    emit(LocalArticleLoadingState());
    final articles = await _getAllSavedArticles();
    emit(LocalArticleLoadedState(articles));
  }

  void onSaveArticle(
      ArticleEntity article, Emitter<LocalArticleState> emit) async {
    await _saveArticle(article);
    onGetSavedArticles(emit);
  }

  void onDeleteArticle(
      ArticleEntity article, Emitter<LocalArticleState> emit) async {
    await _deleteSavedArticle(article);
    onGetSavedArticles(emit);
  }
}
