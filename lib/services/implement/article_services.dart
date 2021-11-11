import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_api/model/article.dart';
import 'package:new_api/services/article_api.dart';
import 'package:new_api/util/api_key.dart';
class ArticleServices extends ArticleApi {
  @override
  Future<List<Article>> getListArticles(String topic) async {
    try {
      http.Response response = await http.get(
        Uri.parse('https://newsapi.org/v2/everything?q=$topic&apiKey=$apiKey'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      int statusCode = response.statusCode;
      if (200 >= statusCode && statusCode <= 299) {
        return jsonDecode(utf8.decode(response.bodyBytes))['articles']
            .cast<Map<String, dynamic>>()
            .map<Article>((e) => Article.fromJson(e))
            .toList();
      }
      if (400 <= statusCode && statusCode <= 499) {
        throw Exception('Bad request');
      } else if (500 <= response.statusCode && response.statusCode <= 599) {
        throw Exception('Server Error');
      }
      return [];
    } catch (error) {
      throw Exception('Đã có lỗi xảy ra');
    }
  }
}
