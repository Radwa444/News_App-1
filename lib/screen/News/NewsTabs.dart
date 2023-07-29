import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/Api_manager.dart';
import '../Category/Category.dart';
import '../../shared/style/component/Container_source.dart';
import '../../shared/style/component/acticle.dart';
import 'new_view_model.dart';

class NewsTaps extends StatefulWidget {
  @override
  State<NewsTaps> createState() => _NewsTapsState();
  Container_Category? category;
  NewsTaps({this.category});
  var viewModel = NewsViewModel();
}

class _NewsTapsState extends State<NewsTaps> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsViewModel()..getSouce(widget.category?.title ?? ""),
      child: BlocConsumer<NewsViewModel, NewsStatc>(
        listener: (context, state) {
          if (state is LoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            Text(state.erorr);
          } else if (state is SuccessState) {}
        },
        builder: (BuildContext context, Object? state) {
          return DefaultTabController(
              length: NewsViewModel.get(context).sourse.length,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  TabBar(
                    tabs: NewsViewModel.get(context)
                        .sourse
                        .map((sourse) => Container_sourse(
                            sourse,
                            selected ==
                                NewsViewModel.get(context)
                                    .sourse
                                    .indexOf(sourse)))
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
                        children: NewsViewModel.get(context)
                            .sourse
                            .map((sourse) => Article(sourse))
                            .toList()),
                  )
                ],
              ));
        },
      ),
    );
  }
}
