import 'package:flutter/material.dart';
import 'package:qwikly/screens/setup3.dart';
import 'package:qwikly/screens/setup_4.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyAppp());
  }
}
