import 'package:flutter/material.dart';
import 'package:qwikly/screens/introduction_screen.dart';
import 'package:qwikly/screens/login_screen.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Introduction());
  }
}
