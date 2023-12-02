import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:flutter_grid_button/flutter_grid_button.dart';
import 'package:bolt_app/widgets/widgets.dart';
import "package:bolt_app/utils/constants.dart";


class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboard();
}

class _dashboard extends State<dashboard> {
 // static const String _title = 'Bolt';
  static const String _quip = 'Bolt Metrics';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _quip,
      home: Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: const Text(_quip),
        backgroundColor: kThemeTertiaryColor ,
        shape:const RoundedRectangleBorder( borderRadius: BorderRadius.only(bottomLeft: Radius.circular(42),bottomRight:Radius.circular(42) ))), 

        body:  Column(
          children: <Widget>[
            Spacer(flex: 1,),
            CircularIndicator(),
            Spacer(),
            ElevatedCardExample2(),
           Spacer(flex: 1,),
            ElevatedCardExample(),
           Spacer(),
          ],
        ),
      ),
    );
  }
}
class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 13.0,
      animation: true,
      percent: 0.95,
      center: const Text(
        "95%",
        style: kLogInScreenHeadingText //new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      footer: const Text(
        "Charging Percentage",
        style: kLogInScreenHeadingText//new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: const Color.fromARGB(255, 6, 66, 131),
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
  

