import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/daily_news/domain/entities/article.dart';
import 'package:movie_app/features/daily_news/presentation/pages/article_details/article_details.dart';
import 'package:movie_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:movie_app/features/daily_news/presentation/pages/saved_article/saved_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(
          const DailyNews(),
        );

      case '/ArticleDetails':
        return _materialRoute(
          ArticleDetailsView(
            article: settings.arguments as ArticleEntity,
          ),
        );

      case '/SavedArticles':
        return _materialRoute(
          const SavedArticles(),
        );

      default:
        return _materialRoute(
          const DailyNews(),
        );
    }
  }

  static Route _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
