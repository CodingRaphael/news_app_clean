import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:movie_app/features/daily_news/data/data_source/local/DAO/article_dao.dart';
import 'package:movie_app/features/daily_news/data/models/article_model.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDAO;
}
