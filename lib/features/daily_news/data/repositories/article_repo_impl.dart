import 'dart:io';
import 'package:dio/dio.dart';
import 'package:movie_app/core/res/data_state.dart';
import 'package:movie_app/core/utils/constant.dart';
import 'package:movie_app/features/daily_news/data/data_source/local/DAO/app_database.dart';
import 'package:movie_app/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:movie_app/features/daily_news/data/models/article_model.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/domain/repositories/article_repo.dart';

class ArticleRepoImpl implements ArticleRepo {
  ArticleRepoImpl(NewsApiService newsApiService, this._appDatabase)
      : _newsApiService = newsApiService;

  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final result = await _newsApiService.getNewsArticles(
          apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);

      return DataSuccess(result);
    } on DioException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(DioException(requestOptions: RequestOptions()));
    }
  }

  @override
  Future<void> deleteSavedArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<List<ArticleModel>> getAllSavedArticles() {
    return _appDatabase.articleDAO.getAllArticles();
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
