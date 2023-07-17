import 'package:flutter/material.dart';

import '../../../api/Api_manager.dart';

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
    return FutureBuilder(
      future: ApiManager.getArticle(q: query),
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
                    ClipPath(
                        child: Image.network(sources[index].urlToImage ?? '')),
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
                return null;
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('data');
  }
}
