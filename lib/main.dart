import 'package:exam_2/screens/homepage.dart';
import 'package:exam_2/screens/viewpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => homepage(),
        'viewpage': (context) => viewpage(),
      },
    ),
  );
}
