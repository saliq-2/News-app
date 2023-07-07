import 'package:flutter/material.dart';

import '../../model/news_model.dart';

class news_info extends StatelessWidget
{
  Article obj;
  news_info({required this.obj});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(child: Image.network(obj.image)),
            ],
          ),
        ),
      ),
    );
  }
}