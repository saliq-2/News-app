import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/news_model.dart';
import 'package:news/screens/news_info/news_info.dart';
class All extends StatefulWidget
{

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  late Map<String,dynamic> map;
  List<Article> news=[];
  bool isLoading=true;
  void getData() async
  {
    final response=await  http.get(Uri.parse("https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=in&max=50&apikey=d3256a2afe2e2289ece2efa4c8f4b4f1"));
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
                    padding: const EdgeInsets.only(bottom: 8,top: 8),
                    child: ListTile(

                      leading: Image.network(news[index].image,width: 100,height: 100,),
                      title: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>news_info(obj: news[index])));
                          },

                          child: Text(news[index].title,style: TextStyle(fontWeight: FontWeight.bold),)),
                      subtitle: Row(
                        children: [
                          Icon(Icons.watch_later_outlined),
                          Text(


                              news[index].publishedAt.toString(),






                          ),

                        ],
                      ),
                      trailing: Icon(Icons.remove_red_eye),
                    ),

                  )

            ),
          ),
        ],
      ),
    );
  }
}