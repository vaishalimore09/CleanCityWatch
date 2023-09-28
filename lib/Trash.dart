import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Trash extends StatefulWidget {
  const Trash({super.key});

  @override

  State<Trash> createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  @override

  final _fullnameController=TextEditingController();
  final _contactController=TextEditingController();
  final _locationController=TextEditingController();
  final _dateController=TextEditingController();
  final _descriptionController=TextEditingController();
  final _trasController=TextEditingController();
  void dispose(){
    _fullnameController.dispose();
    _contactController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();
    _trasController.dispose();

  }
  Future signIn() async{
    adduserdetails(
        _fullnameController.text.trim(),
        _contactController.text.trim(),
    _locationController.text.trim(),
    _dateController.text.trim(),
    _descriptionController.text.trim(),
      _trasController.text.trim(),
    );

  }
  Future adduserdetails(String fullname,String contact,String location,String date,String Des,String trash) async{
    await FirebaseFirestore.instance.collection('user').add({
      'Full Name':fullname,
      'Contact':contact,
      'location':location,
      'Description':Des,
      'Trash_type':trash

    });
  }







  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: ListView(


          children: [
            SizedBox(
              height: 50.0,
            ),
            Center(
              child: Text("DETAILS",style: TextStyle(fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.red),

              ),
            ),
      SizedBox(
        height: 30.0,
      ),
      Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
      decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 1.0),
      child: TextField(
      controller: _fullnameController,
      style: TextStyle(
      fontSize: 15.0,
      ),
      decoration: InputDecoration(
      border:InputBorder.none,

      hintText: "Enter your Name",
      ),
      ),
      ),
      ),
      ),



      Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
      decoration: BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(17),
      ),
      child: Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 1.0),
      child: TextField(
      controller: _contactController,
      obscureText: true,
      style: TextStyle(
      fontSize: 15.0,
      ),
      decoration: InputDecoration(
      border:InputBorder.none,


      hintText: "Enter your Contact Number",
      ),
      ),
      ),
      ),
      ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 1.0),
                  child: TextField(
                    controller: _locationController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      border:InputBorder.none,


                      hintText: "Enter your Location",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 1.0),
                  child: TextField(
                    controller: _dateController,

                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    decoration: InputDecoration(
                      border:InputBorder.none,


                      hintText: "Enter the Date",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 1.0),
                  child: TextField(

                    controller: _trasController,

                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    decoration:

                    InputDecoration(
                      border:InputBorder.none,
                      hintText: "Trash Type",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 1.0, 0.0, 1.0),
                  child: TextField(

                    controller: _descriptionController,

                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    decoration:

                    InputDecoration(
                      border:InputBorder.none,
                      hintText: "Description",
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){
                signIn();
              },

              child: Container(
                height: 50,
                width: 360,
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12.0)

                ),
                child: Center(
                  child: Text("Submit",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),

                ),
              ),
            ),
          ),


      ],
      ),
        ),
    )

    ;
  }
}
