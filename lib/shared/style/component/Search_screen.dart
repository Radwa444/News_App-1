import 'package:flutter/material.dart';

import '../../../api/Api_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screen/News/Article_view_model.dart';

class SearchClass extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.close,
            size: 30,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
        create: (context) => ArticleViewModel()..getArticle(q: query),
        child: BlocConsumer<ArticleViewModel, ArticleStatc>(
            listener: (context, state) {
          if (state is LoadingArticleStatc) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ErrorArticleStatc) {
            Text(state.error);
          } else if (state is SuccessArticleStatc) {}
        }, builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: ArticleViewModel.get(context).articles?.length,
              itemBuilder: (context, index) {
                print(ArticleViewModel.get(context).articles?.length);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipPath(
                        child: Image.network(ArticleViewModel.get(context)
                                .articles?[index]
                                .urlToImage ??
                            '')),
                    Text(
                      ArticleViewModel.get(context)
                              .articles?[index]
                              .source
                              ?.name ??
                          '',
                      style: const TextStyle(fontSize: 18, color: Colors.black),
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

          // return FutureBuilder(
          //   future: ApiManager.getArticle(q: query),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasError) {
          //       return Text(snapshot.error.toString());
          //     } else if (snapshot.hasData) {
          //       var sources = snapshot.data?.articles ?? [];
          //       return Padding(
          //         padding: const EdgeInsets.all(8.0),
          // child: ListView.builder(
          //   itemCount: sources.length,
          //   itemBuilder: (context, index) {
          //     print(sources.length);
          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         ClipPath(
          //             child: Image.network(sources[index].urlToImage ?? '')),
          //         Text(
          //           sources[index].source?.name ?? '',
          //           style: const TextStyle(fontSize: 18, color: Colors.black),
          //           textAlign: TextAlign.start,
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           sources[index].title ?? '',
          //           style: const TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.black),
          //           textAlign: TextAlign.start,
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           sources[index].publishedAt ?? '',
          //           style: const TextStyle(fontSize: 18, color: Colors.black),
          //           textAlign: TextAlign.end,
          //         ),
          //         const SizedBox(
          //           height: 10,
          //         ),
          //       ],
          //     );
          //     return null;
          //   },
          // ),
          // );
          //  } else {
          //   return const Center(child: CircularProgressIndicator());
          //   }
          // },
        }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('data');
  }
}
