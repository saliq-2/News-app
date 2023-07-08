import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/screens/homescreeen.dart';
import 'package:news/screens/news_info/news_info.dart';

import '../../model/news_model.dart';

class homepage extends StatefulWidget
{
  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  late Map<String,dynamic> map;
  List<Article> news=[];
  bool isLoading=true;


  void getData() async
  {
    final response=await  http.get(Uri.parse("https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=in&max=50&apikey=d3256a2afe2e2289ece2efa4c8f4b4f1"));
   print(response.statusCode);
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
    getData();
    super.initState();

  }
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      isLoading?Center(child: CircularProgressIndicator()):
      Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,

                image: NetworkImage(news[3].image)
              ),

              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35),bottomRight: Radius.circular(35)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(news[3].title,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),),
                ],
              ),
            ),



            height: 400,


          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Breaking News",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25),),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>homescreen()));
                }, child: Text("See All",style: TextStyle(fontSize: 16),))
              ],
            ),
          ),
          SizedBox(height: 3,),
          CarouselSlider.builder(

              itemCount: news.length,
              itemBuilder: (context,index,i)=>
               Container(
                 height: 500,
                 margin: EdgeInsets.only(left: 8),


                 color: Colors.grey.shade200,
                 child: Column(
                   children: [
                     InkWell(
                         onTap: ()
                         {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>news_info(obj: news[index])));
                         },
                         child: Image.network(news[index].image,fit: BoxFit.cover,)),


                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Text(news[index].title,style: TextStyle(fontWeight: FontWeight.bold),),
                     ),
                   ],
                 ),
               )
              , options: CarouselOptions(
            aspectRatio: 16/11,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),


          )
          )
        ],
      ),
    );
  }
}