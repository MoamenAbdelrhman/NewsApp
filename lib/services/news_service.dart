import 'package:dio/dio.dart';
import 'package:first_app/model/article_model.dart';
import 'package:first_app/model/source_model.dart';

class NewsService {
  static const String _apiKey = '0068172daf3b4a00863dbc372c08aed9';
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/v2/'));

  Future<List<Article>> fetchEverything(String query) async {
    try {
      final response = await _dio.get(
        'everything',
        queryParameters: {
          'q': query,
          'apiKey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'ok') {
          final List articlesJson = data['articles'];
          return articlesJson.map((json) => Article.fromJson(json)).toList();
        } else {
          throw Exception('API Error: ${data['message']}');
        }
      } else {
        throw Exception('Failed to fetch articles');
      }
    } catch (e) {
      throw Exception('Error fetching articles: $e');
    }
  }

  Future<List<Article>> fetchTopHeadlines(String country, {String? category}) async {
    try {
      final response = await _dio.get(
        'top-headlines',
        queryParameters: {
          'country': country,
          if (category != null) 'category': category,
          'apiKey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'ok') {
          final List articlesJson = data['articles'];
          return articlesJson.map((json) => Article.fromJson(json)).toList();
        } else {
          throw Exception('API Error: ${data['message']}');
        }
      } else {
        throw Exception('Failed to fetch top headlines');
      }
    } catch (e) {
      throw Exception('Error fetching top headlines: $e');
    }
  }

  Future<List<NewsSource>> fetchSources() async {
    try {
      final response = await _dio.get(
        'top-headlines/sources',
        queryParameters: {
          'apiKey': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 'ok') {
          final List sourcesJson = data['sources'];
          return sourcesJson.map((json) => NewsSource.fromJson(json)).toList();
        } else {
          throw Exception('API Error: ${data['message']}');
        }
      } else {
        throw Exception('Failed to fetch sources');
      }
    } catch (e) {
      throw Exception('Error fetching sources: $e');
    }
  }
}