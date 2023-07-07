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

        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("BB ",style: TextStyle(color: Color(0xFF488ae9)),),
        ),
      ),
      body:SafeArea(



        child: Container(

          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                    indicatorWeight: 2,
                    indicatorColor: Colors.blueAccent,



                    tabs: [
                  Text("All",style: TextStyle(color: Color(0xFF9a9aa7)),),
                  Text("Latest",style: TextStyle(color: Color(0xFF9a9aa7)),),
                      Text("Science",style: TextStyle(color: Color(0xFF9a9aa7)),),
                      Text("Sports",style: TextStyle(color: Color(0xFF9a9aa7)),),
                ]),
              ),
              SizedBox(height: 20,),
              
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(children: [
                    All(),
                    latest(),

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