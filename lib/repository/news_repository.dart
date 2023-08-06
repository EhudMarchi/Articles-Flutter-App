import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/article.dart';

class NewsRepository {
  final String apiKey;
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us';

  NewsRepository({required this.apiKey});

  Future<List<Article>> getNews() async {
    final response = await http.get(Uri.parse('$apiUrl&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> articlesJson = jsonData['articles'];
      final List<Article> articles = articlesJson.map((articleJson) => Article.fromJson(articleJson)).toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }


  Future<List<Article>> searchNews(String searchTerm) async {
    final response = await http.get(Uri.parse('$apiUrl&q=$searchTerm&apiKey=$apiKey'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<Article> articles = (jsonData['articles'] as List)
          .map((articleJson) => Article(
        title: articleJson['title'],
        description: articleJson['description'],
        url: articleJson['url'],
        urlToImage: articleJson['urlToImage'],
        content: articleJson['content'],
        publishedAt: articleJson['publishedAt'],
        source: articleJson['source']['name'],
      ))
          .toList();
      return articles;
    } else {
      throw Exception('Failed to search news');
    }
  }
}
