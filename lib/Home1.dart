import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/Contact.dart';
import 'package:login/help.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/main_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.lightBlue,
        child: ListView(
          children: [
            DrawerHeader(child:CircleAvatar(
              backgroundColor: Colors.white,
              radius:2,
              child: Icon(Icons.person,size: 80),



            ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("Help",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,

                ),),
                leading: Icon(Icons.home,size: 50.0
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>helpus()));
                },


              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(

                title: Text("Contact Us",style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,

                ),),
                leading: Icon(Icons.calendar_month,size: 50.0),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Contactus()));
                },


              ),
            ),

          ],
        ),
      ),
    );
  }
}
