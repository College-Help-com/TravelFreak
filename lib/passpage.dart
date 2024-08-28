import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PassPage extends StatefulWidget {
  @override
  State<PassPage> createState() => _PassPageState();
}

class _PassPageState extends State<PassPage> {
  var pass = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    enter();
  }

  void enter ()async{
    SharedPreferences spb = await SharedPreferences.getInstance();
    pass = spb.getString('PI').toString();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Password"),
      ),
      body: Column(
        children: [
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
                title: Text(pass),
                leading: Icon(Icons.password),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
