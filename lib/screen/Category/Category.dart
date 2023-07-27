import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Category_srceen extends StatelessWidget {
  List<Container_Category> catgories=[
    Container_Category(Colors.red, 'sports', 'assets/images/ball.png'),
    Container_Category(Colors.blue, 'business', 'assets/images/bussines.png'),
    Container_Category(Colors.redAccent, 'entertainment', 'assets/images/environment.png'),
    Container_Category(Colors.brown, 'general', 'assets/images/bussines.png'),
    Container_Category(Colors.orange, 'health', 'assets/images/health.png'),
    Container_Category(Colors.pink, 'science', 'assets/images/science.png'),
    Container_Category(Colors.green, 'technology', 'assets/images/Politics.png'),

  ];
  Function onclickCategory;
  Category_srceen(this.onclickCategory);
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [const SizedBox(height: 10,),
          const Text('Pick your category of internet',
              style: TextStyle(
                  fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: catgories.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 1.2),
              itemBuilder: (context, index) {
                return InkWell(onTap: (){
                  onclickCategory(catgories[index]);
                },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: catgories[index].color,
                        borderRadius: BorderRadius.only(
                            topRight: const Radius.circular(30),
                            topLeft: const Radius.circular(30),
                            bottomLeft: Radius.circular(index % 2 == 0 ? 30 : 0),
                            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 30))),
                    child: Column(
                      children: [Image.asset(catgories[index].baseImage,width: 120,height: 120,),
                        Text(catgories[index].title,style: const TextStyle(fontSize: 25,color: Colors.white),),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ]);
  }
}

class Container_Category {
  Color color;
  String title;
  String baseImage;
  Container_Category( this.color, this.title,this.baseImage);
}