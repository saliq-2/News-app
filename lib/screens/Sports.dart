import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/news_model.dart';
class Sports extends StatefulWidget
{

  @override
  State<Sports> createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  late Map<String,dynamic> map;
  List<Article> news=[];
  bool isLoading=true;
  void getData() async
  {
    final response=await  http.get(Uri.parse("https://gnews.io/api/v4/top-headlines?category=sports&lang=en&country=in&max=50&apikey=d3256a2afe2e2289ece2efa4c8f4b4f1"));
    if(response.statusCode==200)
    {
      map=json.decode(response.body);
      news=NewModel.fromJson(map).articles;
      setState((){isLoading=false;});


    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return isLoading?Center(child: CircularProgressIndicator()): Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context,index)=>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(

                              fit: BoxFit.cover,
                              image: NetworkImage(news[index].image)),
                        ),
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(news[index].description+"read more",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        )
                    ),
                  ),

            ),
          ),
        ],
      ),
    );
  }
}