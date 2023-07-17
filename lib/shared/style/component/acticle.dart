import 'package:flutter/material.dart';

import '../../../api/Api_manager.dart';
import '../../../api/Source_response/Source_response.dart';

class Article extends StatefulWidget {
  Sources source;
  Article(this.source);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticle(source: widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          var sources = snapshot.data?.articles ?? [];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: sources.length,
              itemBuilder: (context, index) {
                print(sources.length);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        const CircularProgressIndicator(),
                        ClipRRect(
                            child: Image.network(
                                height:
                                    MediaQuery.of(context).size.height * 25.0,
                                sources[index].urlToImage ?? '')),
                      ],
                    ),
                    Text(
                      sources[index].source?.name ?? '',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      sources[index].title ?? '',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      sources[index].publishedAt ?? '',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      textAlign: TextAlign.end,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
