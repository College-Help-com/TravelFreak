import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelfreak_playstore/about.dart';
import 'package:travelfreak_playstore/display.dart';
import 'package:travelfreak_playstore/login.dart';
import 'package:travelfreak_playstore/passpage.dart';

import 'admanager.dart';

class Profile extends StatefulWidget {  @override
State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var email = "";
  var password = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enter();
  }

  void enter ()async{
    SharedPreferences spb = await SharedPreferences.getInstance();
    email = spb.getString('EI').toString();
    password = spb.getString('PI').toString();

    setState(() {

    });
  }
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(email,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,5),
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10
                      )
                    ]
                ),
                child: ListTile(
                  title: Text("Password"),
                  leading: Icon(Icons.password),
                  trailing: IconButton(onPressed: () async{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PassPage()));
                    await AdsManager.showIntAd();
                  },icon: Icon(Icons.arrow_forward),),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0,5),
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 10
                      )
                    ]
                ),
                child: ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.apps),
                  trailing: IconButton(onPressed: () async{
                    await AdsManager.showIntAd();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>About()));

                  },icon: Icon(Icons.arrow_forward),),
                ),
              ),
            ),
            SizedBox(height: 10,),


          ],
        ),
      ),
    );
  }}
