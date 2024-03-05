import 'package:flutter/material.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<StatefulWidget> createState() => MyTicketsState();
}

class MyTicketsState extends State<MyTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("My Tickets"));
  }
}
