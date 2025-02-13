import 'package:get_it/get_it.dart';
import 'package:movie_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/features/daily_news/data/repositories/article_repo_impl.dart';
import 'package:movie_app/features/daily_news/domain/repositories/article_repo.dart';
import 'package:movie_app/features/daily_news/domain/usecase/get_article.dart';
import 'package:movie_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.I;

Future<void> initializeDependecies() async {
  // ! externals
  sl.registerFactory(() => http.Client());
  //dependencies
  sl.registerSingleton<NewsApiService>(NewsApiServiceImp(client: sl()));
  sl.registerSingleton<ArticleRepo>(ArticleRepoImpl(sl()));
  //usecases
  sl.registerSingleton<GetArticle>(GetArticle(sl()));

  //blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
