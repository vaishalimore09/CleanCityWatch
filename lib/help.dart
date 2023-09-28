import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login/main_page.dart';

class helpus extends StatefulWidget {
  const helpus({super.key});

  @override
  State<helpus> createState() => _helpusState();
}

class _helpusState extends State<helpus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help"))

    );
  }
}
