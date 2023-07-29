import 'package:flutter/material.dart';
import '../../../api/Api_manager.dart';
import '../../../api/article_response/article_response.dart';
import 'package:newapp/shared/style/component/web_view.dart';
class News_Title extends StatelessWidget {
  static const String routeName = 'Title';

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title ?? ''),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
              child:
                  Image.network(fit: BoxFit.fill, articles.urlToImage ?? '')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  articles.source?.name ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.left,
                ),
                Text(
                  articles.title ?? '',
                  style: const TextStyle(fontSize: 20, color: Colors.black54),
                  textAlign: TextAlign.left,
                ),Text(
                  articles.publishedAt ?? '',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 20,),
                Text(
                  articles.description ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 60,),
                InkWell(onTap: (){
                 Navigator.pushNamed(context, Web_view.routeName,arguments: articles);
                },
                  child: const Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    Text(
                      'view full Articl',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.right,

                    ),
                      Icon(Icons.play_arrow)
                  ],),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
