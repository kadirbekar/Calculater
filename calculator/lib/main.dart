import 'package:flutter/material.dart';
import './interfaces/home.dart';


void main(){
  runApp(MaterialApp(
    title: 'Example',
    theme: ThemeData(
      //primarySwatch: Colors.blue,
    ),
    home: FirstPage(),
  ));
}