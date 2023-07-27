import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider_lanauges.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> listlanguages = ["english", 'Arabic'];

  String Selected = 'english';

  @override
  Widget build(BuildContext context) {
    var proveter=Provider.of<Provider_lanauges>(context,);
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Language',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(border: Border.all(color: Colors.green)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'english',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                const Spacer(),
                DropdownButton<String>(
                  value: Selected,
                  items: listlanguages
                      .map((language) => DropdownMenuItem(
                    value: language,
                    child: Text(
                      language,
                      style: TextStyle(fontSize: 20),
                    ),
                  ))
                      .toList(),
                  onChanged: ( language) {
                    setState(() {
                      Selected=language!;
                      if(Selected=='english'){
                        proveter.changelanganeEN();
                      }else{
                        proveter.changelanganeAR();
                      }
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
