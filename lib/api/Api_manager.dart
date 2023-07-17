import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Source_response/Source_response.dart';
import 'article_response/article_response.dart';

class ApiManager {
  static const String baseURL = 'newsapi.org';
  static const String apiKey = '0429ec37f63f494d8778032875e4eb5e';
  static Future<SourceResponse> getSource(String category) async {
    var uri = Uri.http(baseURL, '/v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': category});
    var response = await http.get(uri);

    var sourseResponse = SourceResponse.fromJson(jsonDecode(response.body));
    return sourseResponse;
  }

  static Future<ArticleResponse> getArticle({String? source, String? q}) async {
    var uri = Uri.http(baseURL, '/v2/everything',
        {'apiKey': apiKey, 'sources': source, 'q': q});
    var response = await http.get(uri);
  print(response.body);
    var articleResponse = ArticleResponse.fromJson(jsonDecode(response.body));
    return articleResponse;
  }
}
