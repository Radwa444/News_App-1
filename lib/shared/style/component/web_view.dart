import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../api/article_response/article_response.dart';

class Web_view extends StatelessWidget {
  static const String routeName = 'Web_View';
  late WebViewController controller;

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)?.settings.arguments as Articles;
    controller = WebViewController()

      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(articles.url ?? ''));

    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(controller: controller),
    );
  }
}
