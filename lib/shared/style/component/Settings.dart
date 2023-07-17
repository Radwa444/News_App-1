import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.back_hand))
              ],
            ),
          )
        ],
      ),
    );
  }
}
