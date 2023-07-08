import 'package:flutter/material.dart';
import 'package:news/screens/headlines.dart';

import 'Sports.dart';
import 'all.dart';
import 'latest.dart';

class homescreen extends StatelessWidget
{





  @override
  Widget build(BuildContext context) {

    return
      DefaultTabController(
        initialIndex: 0,
        length: 4, child:


      Scaffold(


      backgroundColor: Color(0xFFf5f7fb),
      appBar: AppBar(

        backgroundColor: Color(0xFFf5f7fb),
        elevation: 0,

      ),
      body:SafeArea(



        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Discover ",style: TextStyle(fontSize: 35,fontWeight: FontWeight.w900),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("News from all over the world",style: TextStyle(fontWeight: FontWeight.w300),),
              ),
              SizedBox(height: 30,),
              Center(
                child: SizedBox(
                  width: 400,
                  child: TextField(


                    decoration: InputDecoration(
                      label: Text("Search"),
                      suffixIcon: Icon(Icons.filter_alt),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11)
                      )
                    ),

                  ),
                ),
              ),
              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                    indicatorWeight: 2,
                    indicatorColor: Colors.blueAccent,



                    tabs:
                    [
                  Text("All",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600  ),),
                  Text("Latest",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600  )),
                      Text("Science",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600  )),
                      Text("Sports",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600  )),
                ]
                ),
              ),
              SizedBox(height: 20,),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(children: [
                    All(),
                    world(),

                    headlines(),
                    Sports(),





      ]
    ),
                ),
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}