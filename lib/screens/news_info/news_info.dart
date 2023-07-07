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
      appBar: AppBar(

      ),
      body:Stack(
        children: [
          Container(
            width: 600,
            height: 400,
            child: Image.network(obj.image,fit: BoxFit.cover,),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 350,),

            Container(
              height: 500,



              decoration: BoxDecoration(
                  color: Colors.yellow,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(obj.publishedAt.toString()),
                  Text(obj.title),
                  Text(obj.description),
                  Text(obj.content,style: TextStyle(fontSize: 20),),
                ],
              ) ,
            )
          ],)
          
        ],
      )
    );
  }
}