import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {

  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _emailCotroller=TextEditingController();
  final _passwordController=TextEditingController();
 Future signIn() async{
   await FirebaseAuth.instance.signInWithEmailAndPassword(
       email: _emailCotroller.text.trim(), password: _passwordController.text.trim());
 }


  @override
  void dispose(){
   _emailCotroller.dispose();
   _passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.0,
              ),
              Icon(Icons.fire_truck,
              size: 50,),




              Center(
                child: Text("Home Again !",style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: 20.0,

              ),
              Center(
                child: Text("Welcome Back",style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              SizedBox(
                height: 20.0,
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
                      controller: _emailCotroller,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      decoration: InputDecoration(
                        border:InputBorder.none,

                            hintText: "Email",
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
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      decoration: InputDecoration(
                        border:InputBorder.none,


                        hintText: "Password",
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  signIn();
                },

                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 50,
                    width: 360,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12.0)

                    ),
                    child: Center(
                      child: Text("Sign In",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not Register?",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold

                  ),),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Text(" Register Now",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,


                      ),),
                  ),

                ],
              )

            ],
          ),
        ),

      ),
    );
  }
}
