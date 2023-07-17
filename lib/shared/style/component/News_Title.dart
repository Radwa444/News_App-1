import 'package:flutter/material.dart';
import '../../../api/Api_manager.dart';
import '../../../api/article_response/article_response.dart';


class News_Title extends StatelessWidget {
  static const String routeName='Title';


  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(title: Text(articles.title??''),),

    );
  }
}
