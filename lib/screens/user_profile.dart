import 'package:flutter/material.dart';

class user_profile extends StatelessWidget
{
  List <String> tile_info=["Saliq","saliq@gmail.com","Premium","About Us","Contact Us"];
  List<Icon> icons=[Icon(Icons.account_circle_outlined),Icon(Icons.email_outlined,color: Colors.red.shade300,),Icon(Icons.subscriptions_outlined,color: Color(0xFFFFD700),),Icon(Icons.add_alert,color: Colors.blueAccent,),Icon(Icons.phone,color: Colors.greenAccent,),];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Icon(Icons.account_circle_outlined,size: 250,),
              SizedBox(height: 100,),
              Expanded(
                child: ListView.builder(
                    itemCount: tile_info.length,
                    itemBuilder: (context,index)=>
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            tileColor: Colors.grey.shade100,
                            leading: (icons[index]),
                            title: Text(tile_info[index]),
                          ),
                        )

                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}