import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import "package:bolt_app/utils/constants.dart";

//import 'package:flip_card/flip_card.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key, Key? keys});

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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 160,
                  height: 150,
                  child: Center(child: Text('Current',
                  style: kGetStartedButtonText)),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 160,
                  height: 150,
                  child: Center(child: Text('40 amps',
                  style: kGetStartedButtonText)),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 160,
                  height: 150,
                  child: Center(child: Text('Voltage',
                  style: kGetStartedButtonText)),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 160,
                  height: 150,
                  child: Center(child: Text('40 V',
                  style: kGetStartedButtonText)),
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
  const ElevatedCardExample2({super.key, Key? keys});

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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 175,
                  height: 150,
                  child: Center(child: Text('Time Left',
                  style: kGetStartedButtonText)),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 175,
                  height: 150,
                  child: Center(child: Text('10:30 S',
                  style: kGetStartedButtonText)),
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 175,
                  height: 150,
                  child: Center(child: Text('Power',
                  style: kGetStartedButtonText)),
                ),
              ),
            
          ),
          backWidget: Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: const SizedBox(
                  width: 175,
                  height: 150,
                  child: Center(child: Text('50 KWh', style: kGetStartedButtonText)),
                ),
              ),
            
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types, non_constant_identifier_names
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
        "Charging percentage",
        style: kLogInScreenHeadingText//new TextStyle(fontWeight: FontWeight.bold, fontSize: 19.0),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: const Color.fromARGB(255, 6, 66, 131),
    );
  }
}


