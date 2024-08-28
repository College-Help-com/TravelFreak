import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class About extends StatefulWidget {
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("This application is designed to provide users with a platform to review places they've visited across the globe. By sharing their experiences, users help others to gain a clearer understanding of these locations, enabling them to make informed decisions and take necessary precautions when planning their travels.",style: TextStyle(fontSize: 28),),
              SizedBox(height: 40,),
              Text("In the near future, additional features will be introduced to enhance user interaction and engagement with the application.",style: TextStyle(fontSize: 28),),

            ],
          ),
        ),
      ),
    );
  }
}
