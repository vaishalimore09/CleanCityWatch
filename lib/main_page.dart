import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/Enter.dart';
import 'package:login/Home.dart';
class signingin extends StatefulWidget {
  const signingin({super.key});

  @override
  State<signingin> createState() => _signinginState();
}

class _signinginState extends State<signingin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return enter();
        }
        else{
         return Homepage();
        }


      },),


    );
  }
}
