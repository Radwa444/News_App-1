import 'package:flutter/material.dart';

import '../../../api/Source_response/Source_response.dart';

class Container_sourse extends StatelessWidget {
  Sources sourse;
  bool selected;
  Container_sourse(this.sourse, this.selected);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: selected ? Colors.green : Colors.white,
          border: Border.all(color: Colors.green, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Text(
        sourse.name ?? '',
        style: TextStyle(
            fontSize: 20, color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
