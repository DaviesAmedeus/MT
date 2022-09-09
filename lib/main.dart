import 'package:flutter/material.dart';
import 'package:sms_and_contact/pages/About.dart';
import 'package:sms_and_contact/pages/AllMessages.dart';
import 'package:sms_and_contact/pages/allsms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Welcome to Flutter',
      home: AllSmsScreen(),
    );
  }
}
