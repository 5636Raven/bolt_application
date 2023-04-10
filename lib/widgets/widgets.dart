import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});
  

  @override
  Widget build(BuildContext context) {
return 

    Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
     Card(
        child: SizedBox(
          width: 150,
          height: 150,
         child: Center(child: Text('Voltage')),
        ),
      ),
    Card(
        child: SizedBox(
          width: 150,
          height: 150,
         child: Center(child: Text('Power')),
        ),
      ),
  ],
);
//     return const Center(
//       child: Card(
//         child: SizedBox(
//           width: 200,
//           height: 200,
//           child: Center(child: Text('Elevated Card')),
//         ),
//       ),
//     );
  }
 }

class BarIndicator extends StatelessWidget {
  const BarIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      width: 170.0,
      animation: true,
      animationDuration: 1000,
      lineHeight: 20.0,
      percent: 0.2,
      center: Text("20.0%"),
      linearStrokeCap: LinearStrokeCap.butt,
      progressColor: Colors.lightBlueAccent,
    );
  }
  
}

// ignore: camel_case_types, non_constant_identifier_names
class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 13.0,
      animation: true,
      percent: 0.36,
      center: new Text(
        "36%",
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      footer: new Text(
        "Charging percentage",
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Colors.blueGrey,
    );
  }
}
