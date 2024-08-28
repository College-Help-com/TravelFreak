import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelfreak_playstore/display.dart';
import 'package:travelfreak_playstore/newacc.dart';
import 'package:travelfreak_playstore/resetpass.dart';
import 'package:travelfreak_playstore/display.dart';

class Login extends StatefulWidget {  @override
State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var EmailText = TextEditingController();

  var passText = TextEditingController();
  var NameText = TextEditingController();
  var AgeText = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  final GlobalKey<FormState> _key1 = GlobalKey<FormState>();
  var Value1;
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
      body: Center(
        child: Container(
            width: 300,
            child: SingleChildScrollView(
              child: Form(
                key: _key1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Hey there !",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Center(
                        child: Text(
                          "Welcome Back",
                          style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      controller: EmailText,
                      validator: (Value1){
                        if(Value1!.isEmpty){
                          return"Enter your email";
                        }
                        if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(Value1)){
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.orange
                            )

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black
                            )
                        ),

                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),


                        labelText: "Email",labelStyle: TextStyle(color: Colors.black,fontSize: 16),

                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    TextFormField(
                      cursorColor: Colors.black,
                      controller: passText,
                      obscureText: true,
                      validator: (Value1){
                        if(Value1!.isEmpty){
                          return"Enter your password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.orange
                            )

                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black
                            )
                        ),

                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        labelText: "Password",labelStyle: TextStyle(color: Colors.black,fontSize: 16),

                      ),

                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPass()));

                      }, child: Text("Forgot Password?",style: TextStyle(color: Colors.black,fontSize: 14),)),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(11)
                        ),
                        child: TextButton(
                          child: Text("Sign in",style: TextStyle(color: Colors.black,fontSize: 26),),
                          onPressed: ()async{
                            if(_key1.currentState!.validate()){

                              FirebaseAuth.instance.signInWithEmailAndPassword(email: EmailText.text, password: passText.text).then((value)  async {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Display()));
                                SharedPreferences spa = await SharedPreferences.getInstance() ;
                                spa.setString('EI', EmailText.text.toString());
                                spa.setString('PI', passText.text.toString());
                              }).onError((error, stackTrace) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Something went wrong.Try again"),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              });

                            }else{
                              print("Unsuccessfull");
                            }
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Dont't have an account?"),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewAcc()));

                        }, child: Text("Sign up",style: TextStyle(color: Colors.black,fontSize: 14),)),
                      ],
                    ),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }}
