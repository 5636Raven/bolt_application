import 'package:flutter/material.dart';
import "package:bolt_app/utils/constants.dart";
import 'package:firebase_database/firebase_database.dart';
import 'package:bolt_app/utils/constants.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:bolt_app/firebase_options.dart';
import 'dart:async';


class ElevatedCardExample extends StatefulWidget {
  @override
  _ElevatedCardExampleState createState() => _ElevatedCardExampleState();
}

class _ElevatedCardExampleState extends State<ElevatedCardExample> {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  final controller = FlipCardController();

  String currentData = '0 amps'; // Initial data for current
  String voltageData = '0 V'; // Initial data for voltage

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(child: 
        FlipCard(
          frontWidget: buildCard('Current', currentData, 'Amps'),
          backWidget: buildCard('Current', currentData, 'Amps'),
          controller: controller,
          rotateSide: RotateSide.top,
        ),
        ),
        Flexible(child: 
        FlipCard(
          frontWidget: buildCard('Voltage', voltageData, 'V'),
          backWidget: buildCard('Voltage', voltageData, 'V'),
          controller: controller,
          rotateSide: RotateSide.top,
        ),
        ),
      ],
    );
  }

  Widget buildCard(String title, String data, String unit) {
  return Center(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 185, // Adjust the width as needed
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: kGetStartedButtonText, // Style for the title
            ),
            SizedBox(height: 10), // Add some spacing between title and data
            Text(
              data,
              style: kGetStartedButtonText, // Style for the data
            ),
            SizedBox(height: 10), // Add some spacing between data and additional text
            Text(
              " ",
              style: kGetStartedButtonText, // Style for the additional text
            ),
          ],
        ),
      ),
    ),
  );
}


 

void readDataFromFirebase(String dataPath, Function(String) updateData) {
  DatabaseReference reference = FirebaseDatabase.instance.ref();
  reference.child(dataPath).once().then((DatabaseEvent event) {
    if (event.snapshot != null) {
      DataSnapshot snapshot = event.snapshot;
      String newData = snapshot.value.toString();
      print('Data: $newData');
      updateData(newData);
    } else {
      print('Error: Snapshot is null');
    }
  }).catchError((error) {
    print('Error reading data from Firebase: $error');
  });
}

void updateDataPeriodically() {
  const updateInterval = Duration(seconds: 2); // Adjust the interval as needed

  Timer.periodic(updateInterval, (Timer timer) {
    updateCurrentData();
    updateVoltageData();
  });
}

  void updateCurrentData() {
    readDataFromFirebase('/power_data/Current', (newData) {
      setState(() {
        currentData = newData;
      });
    });
  }

  void updateVoltageData() {
    readDataFromFirebase('/power_data/Voltage', (newData) {
      setState(() {
        voltageData = newData;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Initial data retrieval when the widget is initialized
    updateCurrentData();
    updateVoltageData();
  }
}

class ElevatedCardExample2 extends StatefulWidget {
  @override
  _ElevatedCardExampleState2 createState() => _ElevatedCardExampleState2();
}

class _ElevatedCardExampleState2 extends State<ElevatedCardExample2> {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  final controller = FlipCardController();

  String powerData = '0 Watts'; // Initial data for current

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlipCard(
          frontWidget: buildCard('Power', powerData, 'Watts'),
          backWidget: buildCard('Power', powerData, 'Watts'),
          controller: controller,
          rotateSide: RotateSide.top,
        ),
        FlipCard(
          rotateSide: RotateSide.top,
          onTapFlipping: true,
          axis: FlipAxis.horizontal,
          controller: controller,
          frontWidget: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const SizedBox(
                width: 175,
                height: 150,
                child: Center(
                    child: Text('Time Left',
                        style: kGetStartedButtonText)),
              ),
            ),
          ),
          backWidget: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const SizedBox(
                width: 175,
                height: 150,
                child: Center(
                    child: Text('9:00', style: kGetStartedButtonText)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, String data, String unit) {
  return Center(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: 200, // Adjust the width as needed
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: kGetStartedButtonText, // Style for the title
            ),
            SizedBox(height: 10), // Add some spacing between title and data
            Text(
              data,
              style: kGetStartedButtonText, // Style for the data
            ),
            SizedBox(height: 10), // Add some spacing between data and additional text
            Text(
              " ",
              style: kGetStartedButtonText, // Style for the additional text
            ),
          ],
        ),
      ),
    ),
  );
}

 void readDataFromFirebase(String dataPath, Function(String) updateData) {
  DatabaseReference reference = FirebaseDatabase.instance.ref();
  reference.child(dataPath).once().then((DatabaseEvent event) {
    if (event.snapshot != null) {
      DataSnapshot snapshot = event.snapshot;
      String newData = snapshot.value.toString();
      print('Data: $newData');
      updateData(newData);
    } else {
      print('Error: Snapshot is null');
    }
  }).catchError((error) {
    print('Error reading data from Firebase: $error');
  });
}

void updateDataPeriodically() {
  const updateInterval = Duration(seconds: 2); // Adjust the interval as needed

  Timer.periodic(updateInterval, (Timer timer) {
   updatePowerData();
  });
}


  void updatePowerData() {
    readDataFromFirebase('/power_data/Power', (newData) {
      setState(() {
        powerData = newData;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    // Initial data retrieval when the widget is initialized
    updatePowerData();
  }
}
