import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPass extends StatefulWidget {  @override
State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  var remail = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var Value2;
  Future<void> passwordlink() async{
    try{
      await _auth.sendPasswordResetEmail(email: remail.text);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An email has been sent to your registered email id for password reset"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text("Something went wrong.Try again"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                cursorColor: Colors.black,
                controller: remail,
                validator: (Value2){
                  if(Value2!.isEmpty){
                    return"Enter your email";
                  }
                  if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(Value2)){
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


                  hintText: "Enter your registered email",hintStyle: TextStyle(color: Colors.black,fontSize: 16),

                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(_key.currentState!.validate()){
                  passwordlink();
                }
              }, child: Text("Send"))
            ],
          ),
        ),
      ),
    );
  }}
