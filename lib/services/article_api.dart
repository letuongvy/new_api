
import 'package:new_api/model/article.dart';

abstract class ArticleApi {
  Future<List<Article>> getListArticles(String topic);
}