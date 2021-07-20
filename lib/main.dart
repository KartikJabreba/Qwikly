import 'package:flutter/material.dart';
import 'package:qwikly/screens/sellScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(body: SellScreen(),)
    );
  }
}
