import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/Source_response/Source_response.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/api/Api_manager.dart';

import '../Category/Category.dart';

class NewsViewModel extends Cubit<NewsStatc> {
  NewsViewModel() : super(HomeInitState());
  static NewsViewModel get(context) => BlocProvider.of(context);
  List<Sources> sourse = [];
  static const String baseURL = 'newsapi.org';
  static const String apiKey = '0429ec37f63f494d8778032875e4eb5e';

  void getSouce(String category) {

    emit(LoadingState());
    var uri = Uri.http(baseURL, '/v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': category});
    http.get(uri).then((value) {
      var sourseResponse = SourceResponse.fromJson(jsonDecode(value.body));
      sourse = sourseResponse.sources ?? [];
      emit(SuccessState());
    }).catchError((error) {
      emit(ErrorState(erorr: error));
    });
  }
}

//possibilities(loading,error,success)
abstract class NewsStatc {}

class HomeInitState extends NewsStatc {}

class LoadingState extends NewsStatc {}

class ErrorState extends NewsStatc {
  String erorr;
  ErrorState({required this.erorr});
}

class SuccessState extends NewsStatc {}
