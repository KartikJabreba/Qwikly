import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwikly/addAtributeProvider.dart';
import 'package:qwikly/screens/sellScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AttributesProvider>(
            create: (context) => AttributesProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: SellScreen(),
          )),
    );
    // return MaterialApp(
    // debugShowCheckedModeBanner: false,
    //   home: Scaffold(body: SellScreen(),)
    // );
  }
}
