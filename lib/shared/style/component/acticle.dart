import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/Api_manager.dart';
import '../../../api/Source_response/Source_response.dart';
import 'package:newapp/shared/style/component/News_Title.dart';

import '../../../screen/News/Article_view_model.dart';

class Article extends StatefulWidget {
  Sources source;

  Article(this.source);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArticleViewModel()..getArticle(source: widget.source.id ?? ''),
      child: BlocConsumer<ArticleViewModel, ArticleStatc>(
        listener: (context, state) {
          if (state is LoadingArticleStatc) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ErrorArticleStatc) {
            Text(state.error);
          } else if (state is SuccessArticleStatc) {}
        },
        builder: (BuildContext context, Object? state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: ArticleViewModel.get(context).articles?.length,
              itemBuilder: (context, index) {
                print(ArticleViewModel.get(context).articles?.length);
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, News_Title.routeName,
                        arguments:
                            ArticleViewModel.get(context).articles?[index]);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                          child: Image.network(
                              fit: BoxFit.fill,
                              ArticleViewModel.get(context)
                                      .articles?[index]
                                      .urlToImage ??
                                  '')),
                      Text(
                        ArticleViewModel.get(context)
                                .articles?[index]
                                .source
                                ?.name ??
                            '',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ArticleViewModel.get(context).articles?[index].title ??
                            '',
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
                        ArticleViewModel.get(context)
                                .articles?[index]
                                .publishedAt ??
                            '',
                        style:
                            const TextStyle(fontSize: 18, color: Colors.black),
                        textAlign: TextAlign.end,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
