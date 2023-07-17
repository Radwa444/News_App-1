import 'package:flutter/material.dart';

import '../../../api/Api_manager.dart';
import '../../../screen/Category/Category.dart';
import 'Container_source.dart';
import 'acticle.dart';

class NewsTaps extends StatefulWidget {
  Container_Category category;
  NewsTaps({required this.category});
  @override
  State<NewsTaps> createState() => _NewsTapsState();
}

class _NewsTapsState extends State<NewsTaps> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSource(widget.category.title),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          var sources = snapshot.data?.sources ?? [];

          return DefaultTabController(
              length: sources.length,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  TabBar(
                    tabs: sources
                        .map((sourse) => Container_sourse(
                            sourse, selected == sources.indexOf(sourse)))
                        .toList(),
                    isScrollable: true,
                    indicatorColor: Colors.transparent,
                    onTap: (index) {
                      selected = index;
                      setState(() {});
                    },
                  ),
                  Expanded(
                    child: TabBarView(
                        children:
                            sources.map((sourse) => Article(sourse)).toList()),
                  )
                ],
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
