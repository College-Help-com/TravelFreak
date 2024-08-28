import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit extends StatelessWidget {
  var place,name,description;
  Edit({required this.place,required this.name,required this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Travel",style: TextStyle(fontFamily: 'TitleFont',fontWeight: FontWeight.bold,color: Colors.brown),),
            Text("Freak",style: TextStyle(fontFamily: 'TitleFont',fontWeight: FontWeight.bold,color: Colors.amber),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place,style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),),
              Text(name,style: TextStyle(fontSize: 60),),
              Card(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(description,style: TextStyle(fontSize: 24),),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
