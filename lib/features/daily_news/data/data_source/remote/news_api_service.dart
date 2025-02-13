import 'dart:convert';

import 'package:movie_app/features/daily_news/data/models/article_model.dart';
import 'package:http/http.dart' as http;

abstract class NewsApiService {
  Future<List<ArticleModel>> getNewsArticles({
    String? country,
    String? category,
    String? apiKey,
  });
}

class NewsApiServiceImp implements NewsApiService {
  NewsApiServiceImp({required this.client});

  final http.Client client;

  @override
  Future<List<ArticleModel>> getNewsArticles(
      {String? country, String? category, String? apiKey}) async {
    try {
      final response = await client.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=7923a19dda13424b9933eea7a88866dd'
          //'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey'
          //    'https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey'
          ));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'ok') {
          final articles = (data['articles'] as List<dynamic>)
              .map((articleJson) =>
                  ArticleModel.fromJson(articleJson as Map<String, dynamic>))
              .toList();
          print('data: $articles');
          return articles;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
