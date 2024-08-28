import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelfreak_playstore/display.dart';

class NewAcc extends StatefulWidget {  @override
State<NewAcc> createState() => _NewAccState();
}

class _NewAccState extends State<NewAcc> {
  var EmailText = TextEditingController();

  var passText = TextEditingController();

  var ConfirmpassTex = TextEditingController();

  var Name = TextEditingController();

  var Age = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  var Value;

  final databaseRef = FirebaseDatabase.instance.ref("Details");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 220),
                    child: Text("Name",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    controller: Name,
                    validator: (Value){
                      if(Value!.isEmpty){
                        return"Enter your name";
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 224),
                    child: Text("Email",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                  ),

                  TextFormField(
                    cursorColor: Colors.black,
                    controller: EmailText,
                    validator: (Value){
                      if(Value!.isEmpty){
                        return"Enter your email";
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(Value)){
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
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Text("Create New Password",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                  ),

                  TextFormField(
                    cursorColor: Colors.black,
                    controller: passText,
                    validator: (Value){
                      if(Value!.isEmpty){
                        return"Enter new password";
                      }
                      if(passText.text.length<6){
                        return "Your password is too small";
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
                      hintText: "Use Strong Password",hintStyle: TextStyle(fontSize: 16),

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("Confirm New Password",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                  ),

                  TextFormField(
                    cursorColor: Colors.black,
                    controller: ConfirmpassTex,
                    validator: (Value){
                      if(Value!.isEmpty){
                        return "Enter confirm password";
                      }

                      if(passText.text != ConfirmpassTex.text){

                        return "Password donot match";

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
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 248),
                    child: Text("Age",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                  ),

                  TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    controller: Age,
                    validator: (Value){
                      if(Value!.isEmpty){
                        return"Enter your age";
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
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Container(
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(11)
                      ),
                      child: TextButton(
                        child: Text("Sign up",style: TextStyle(color: Colors.black,fontSize: 26),),
                        onPressed: () async {
                          if(_key.currentState!.validate()){
                            FirebaseAuth.instance.createUserWithEmailAndPassword(email: EmailText.text, password: passText.text).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Your account has been created successfully!!"),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );

                            }).onError((error, stackTrace) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Something went wrong.Try again"),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );

                            });

                            databaseRef.child(DateTime.now().millisecondsSinceEpoch.toString()).child(Name.text.toString()).set({
                              'Password' : passText.text.toString(),
                              'Age' : Age.text.toString(),
                              'Name' : Name.text.toString(),
                              'Email' : EmailText.text.toString(),
                            });
                          }else{
                            print("Unsuccessfull");
                          };
                        },
                      ),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }}
