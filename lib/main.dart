import 'package:flutter/material.dart';
import 'package:rehber_app/contact_page.dart';

void main() {
  runApp(Rehber());
}

class Rehber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ContactPage());
  }
}
