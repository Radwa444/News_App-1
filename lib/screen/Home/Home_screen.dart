import 'package:flutter/material.dart';
import '../News/NewsTabs.dart';
import '../../shared/style/component/Search_screen.dart';
import '../../shared/style/component/Settings.dart';
import '../Category/Category.dart';

class Home_screen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<Home_screen> createState() => _Home_screenState();
}


class _Home_screenState extends State<Home_screen> {
  late Widget Selected_Screen;
  bool selectedTitle=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Selected_Screen=Category_srceen(onclickCategory);
  }
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
                    child: const Center(
                        child: Text(
                          'NEWS APP!' ,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell( onTap: (){
                  selected=null;
                  Selected_Screen=Category_srceen(onclickCategory);
                  selectedTitle=true;
                  Navigator.pop(context);
                  setState(() {

                  });
                },
                  child: const Row(
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
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(onTap: (){
                  Selected_Screen=Settings();
                  Navigator.pop(context);
                  selectedTitle=false;
                  setState(() {

                  });
                },
                  child: const Row(
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
                  ),
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
            title:  Text(selectedTitle==false?'Settings': selected == null ? 'News app' : selected!.title,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                )),
            centerTitle: true,
          ),
          body: Selected_Screen,

        ),
      ),
    );
  }

  Container_Category? selected = null;
  onclickCategory(Container_Category Category) {
    selected = Category;
    Selected_Screen=NewsTaps(category: selected!,);
    selectedTitle=true;
    print(selected);
    setState(() {});
  }
}