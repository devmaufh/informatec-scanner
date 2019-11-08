import 'package:flutter/material.dart';
import 'package:informatec_scanner/resultPage.dart';

import 'homepage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple
      ),
      routes: {
        'home':(BuildContext context) => HomePage(),
        'result':(BuildContext context) => ResultPage()
      },
      initialRoute: 'home',
    );
  }
}