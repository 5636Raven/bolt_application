import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:flip_card/flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = FlipCardController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlipCard(
          rotateSide: RotateSide.top,
          onTapFlipping: true,
          axis: FlipAxis.horizontal,
          controller: controller,
          frontWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('Current')),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('40 amps')),
                ),
              ),
            
          ),
        ),
        FlipCard(
          rotateSide: RotateSide.top,
          onTapFlipping: true,
          axis: FlipAxis.horizontal,
          controller: controller,
          frontWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('Voltage')),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('40 V')),
                ),
              ),
            
          ),
        ),
      ],
    );
  }
}

        // Card(
        //   child: SizedBox(
        //     width: 150,
        //     height: 150,
        //     child: Center(child: Text('Voltage')),
        //   ),
        // ),
        // Card(
        //   child: SizedBox(
        //     width: 150,
        //     height: 150,
        //     child: Center(child: Text('Current')),
        //   ),
        // ),
 
class ElevatedCardExample2 extends StatelessWidget {
  const ElevatedCardExample2({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = FlipCardController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlipCard(
          rotateSide: RotateSide.top,
          onTapFlipping: true,
          axis: FlipAxis.horizontal,
          controller: controller,
          frontWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('Time Left')),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('10:30 S')),
                ),
              ),
            
          ),
        ),
        FlipCard(
          rotateSide: RotateSide.top,
          onTapFlipping: true,
          axis: FlipAxis.horizontal,
          controller: controller,
          frontWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('Power')),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(child: Text('50 KWh')),
                ),
              ),
            
          ),
        ),
      ],
    );
  }
}

// class BarIndicator extends StatelessWidget {
//   const BarIndicator({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return LinearPercentIndicator(
//       width: 170.0,
//       animation: true,
//       animationDuration: 1000,
//       lineHeight: 20.0,
//       percent: 0.2,
//       center: Text("20.0%"),
//       linearStrokeCap: LinearStrokeCap.butt,
//       progressColor: Colors.lightBlueAccent,
//     );
//   }
// }

// ignore: camel_case_types, non_constant_identifier_names
class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 13.0,
      animation: true,
      percent: 0.80,
      center: new Text(
        "80%",
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
