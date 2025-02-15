import 'package:get_it/get_it.dart';
import 'package:movie_app/features/daily_news/data/data_source/local/DAO/app_database.dart';
import 'package:movie_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/features/daily_news/data/repositories/article_repo_impl.dart';
import 'package:movie_app/features/daily_news/domain/repositories/article_repo.dart';
import 'package:movie_app/features/daily_news/domain/usecase/delete_saved_article.dart';
import 'package:movie_app/features/daily_news/domain/usecase/get_all_saved_articles.dart';
import 'package:movie_app/features/daily_news/domain/usecase/get_article.dart';
import 'package:movie_app/features/daily_news/domain/usecase/save_article.dart';
import 'package:movie_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:movie_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.I;

Future<void> initializeDependecies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // ! externals
  sl.registerFactory(() => http.Client());
  //dependencies
  sl.registerSingleton<NewsApiService>(NewsApiServiceImp(client: sl()));
  sl.registerSingleton<ArticleRepo>(ArticleRepoImpl(sl(), sl()));

  //usecases
  sl.registerSingleton<GetArticle>(GetArticle(sl()));
  sl.registerSingleton<DeleteSavedArticle>(DeleteSavedArticle(sl()));
  sl.registerSingleton<GetAllSavedArticles>(GetAllSavedArticles(sl()));
  sl.registerSingleton<SaveArticle>(SaveArticle(sl()));

  //blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  sl.registerFactory<LocalArticleBloc>(
      () => LocalArticleBloc(sl(), sl(), sl()));
}
