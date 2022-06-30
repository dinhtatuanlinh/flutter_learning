import 'package:flutter/material.dart';

class TF extends StatelessWidget{
  String username = "";
  int age = 0;
  TF(this.username, this.age);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.purple,
      alignment: Alignment.bottomCenter,
      child: Text(
        'Username = ${username}, age = ${age}',
        style: TextStyle(fontSize: 30, color: Colors.red),
      ),
    );
  }
}