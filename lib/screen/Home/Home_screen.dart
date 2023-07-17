import 'package:flutter/material.dart';
import '../../shared/style/component/NewsTabs.dart';
import '../../shared/style/component/Search_screen.dart';
import '../Category/Category.dart';

class Home_screen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/1.jpg'),
              fit: BoxFit.fill,
            )),
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Container(
                    color: Colors.green,
                    child: Center(
                        child: Text(
                          selected == null ? 'NEWS APP!' : selected!.title,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(Icons.list, size: 30),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Categorice',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(Icons.settings, size: 30),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'settings',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 80,
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchClass());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30,
                  ))
            ],
            title: const Text('News app',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                )),
            centerTitle: true,
          ),
          body: selected == null
              ? Category_srceen(onclickCategory)
              : NewsTaps(
            category: selected!,
          ),
        ),
      ),
    );
  }

  Container_Category? selected = null;
  onclickCategory(Container_Category Category) {
    selected == Category;
    setState(() {});
  }
}