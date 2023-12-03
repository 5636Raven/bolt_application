import 'package:bolt_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Color _primaryColor = HexColor('#FF1E88E5');
Color _accentColor = HexColor('#FBBDEFBB');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Bolt());
}

class Bolt extends StatelessWidget {
  const Bolt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bolt',
      theme: ThemeData(
        primaryColor: _primaryColor,
        secondaryHeaderColor: _accentColor,
        scaffoldBackgroundColor: HexColor('FFE3F2D'),
        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(title: 'How fast can we get there'),
    );
  }
}



