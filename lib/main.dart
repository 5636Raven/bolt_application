import 'package:bolt_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(Bolt());
}

class Bolt extends StatelessWidget {
  Color _primaryColor = HexColor('#FF1E88E5');
  Color _accentColor = HexColor('#GGBBDEFB');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bolt',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: HexColor('FFE3F2D'),
        primarySwatch: Colors.grey,
      ),
      home:  SplashScreen(title: 'How fast can we get there'),
    );
  }
}
