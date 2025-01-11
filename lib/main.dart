import 'package:flutter/material.dart';
import 'quick_pay_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Pay App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuickPayPage(),
      debugShowCheckedModeBanner: false, // Removes the debug banner
    );
  }
}
