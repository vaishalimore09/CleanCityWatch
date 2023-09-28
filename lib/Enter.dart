import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Capt.dart';
import 'package:login/Home1.dart';
import 'package:login/Trash.dart';
class enter extends StatefulWidget {

  const enter({super.key});

  @override
  State<enter> createState() => _enterState();
}
final List<Widget>_pages=[
  Home(),
  capture(),
  Trash(),
  Center(
    child: Text("Activity",style: TextStyle(
        fontSize: 40
    ),),
  ),



];

class _enterState extends State<enter> {
  int values=0;
  void changeindex(int index){
    setState(() {
      values=index;
    });

  }

  final user=FirebaseAuth.instance.currentUser!;
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        

          body: _pages[values],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: values,
            type: BottomNavigationBarType.fixed,
            onTap: changeindex,




            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home"),
              BottomNavigationBarItem(icon: Icon(Icons.camera),label:"Capture"),
              BottomNavigationBarItem(icon: Icon(Icons.delete),label:"Trash"),
              BottomNavigationBarItem(icon: Icon(Icons.notifications),label:"Activity"),



            ],
          ),
      ),
    );
  }
}
