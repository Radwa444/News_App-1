import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../api/article_response/article_response.dart';

class ArticleViewModel extends Cubit<ArticleStatc> {
  ArticleViewModel() : super(HomeInitState());
  static ArticleViewModel get(context) => BlocProvider.of(context);
  static const String baseURL = 'newsapi.org';
  static const String apiKey = '0429ec37f63f494d8778032875e4eb5e';
  List<Articles>? articles = [];
  void getArticle({String? source, String? q}) {
    emit(LoadingArticleStatc());

    var uri = Uri.http(baseURL, '/v2/everything',
        {'apiKey': apiKey, 'sources': source, 'q': q});
    http.get(uri).then((value) {
      var articleResponse = ArticleResponse.fromJson(jsonDecode(value.body));
      articles = articleResponse.articles;
      emit(SuccessArticleStatc());
    }).catchError((error) {
      emit(ErrorArticleStatc(error: error));
    });
  }
}

//possibilities(loading,error,success)
abstract class ArticleStatc {}

class HomeInitState extends ArticleStatc {}

class LoadingArticleStatc extends ArticleStatc {}

class ErrorArticleStatc extends ArticleStatc {
  String error;
  ErrorArticleStatc({required this.error});
}

class SuccessArticleStatc extends ArticleStatc {}
