import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:bolt_app/widgets/widgets.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboard();
}

class _dashboard extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children:  <Widget>[
            Spacer(),
            CircularIndicator(),
            Spacer(),

            ElevatedCardExample(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
  // Widget build(BuildContext context) {
  //   const textStyle = TextStyle(fontSize: 26);
  //   return MaterialApp(
  //     home: Scaffold(
      
  //       body: Builder(builder: (context) {
         
  //         return Padding(
  //           padding: const EdgeInsets.all(18.0),
            
  //         );
  //       }),
  //     ),
  //   );
  

