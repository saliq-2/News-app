import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/news_model.dart';
class homepage extends StatefulWidget
{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  
  late Map<String,dynamic> map;
  List<Article> news=[];
  bool isLoading=true;
  void getData () async
  {
    final response=await http.get(Uri.parse("https://gnews.io/api/v4/top-headlines?category=sports&lang=en&country=in&max=50&apikey=d3256a2afe2e2289ece2efa4c8f4b4f1"));
    print(response.statusCode);
    if(response.statusCode==200)
      {
        map=json.decode(response.body);
        news=NewModel.fromJson(map).articles;
        print(news.length);
        setState((){
          isLoading=false;
        });



      }
  }
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: isLoading?Center(
        child: CircularProgressIndicator(

        ),
      ):Container(

        child:
        ListView.builder(
            itemCount: news.length,
            itemBuilder: (context,index)=>

        Column(
          children: [
            ClipRRect(
               borderRadius: BorderRadius.circular(11),
              child: Image.network(
                  news[index].image),
            ),
            Text(news[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            Text(news[index].description),
            Text(news[index].content,style: TextStyle(color: Colors.black.withOpacity(0.5)),)

          ],
        )
        )

      ),

    );
  }
}
