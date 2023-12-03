import 'package:flutter/material.dart';
import 'package:bolt_app/utils/constants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
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
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              updateCurrentData();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0 to remove shadow
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: buildCard('Current', currentData, 'Amps', () {
              updateCurrentData();
            }),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              updateVoltageData();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0 to remove shadow
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: buildCard('Voltage', voltageData, 'V', () {
              updateVoltageData();
            }),
          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, String data, String unit, VoidCallback onTapCallback) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: 500, // Adjust the width as needed
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: kLogInScreenHeadingText, // Style for the title
              ),
              SizedBox(height: 20), // Add some spacing between title and data
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data,
                    style: kGetStartedButtonText, // Style for the data
                  ),
                  SizedBox(width: 5), // Add some spacing between data and unit
                  Text(
                    unit,
                    style: kGetStartedButtonText, // Style for the unit
                  ),
                ],
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

  String powerData = '0 Watts'; // Initial data for power

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              updatePowerData();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              elevation: MaterialStateProperty.all<double>(0), // Set elevation to 0 to remove shadow
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: buildCard('Power', powerData, 'Watts', () {
              updatePowerData();
            }),
          ),
        ),
      ],
    );
  }

  Widget buildCard(String title, String data, String unit, VoidCallback onTapCallback) {
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
                style: kLogInScreenHeadingText, // Style for the title
              ),
              SizedBox(height: 10), // Add some spacing between title and data
              Text(
                data,
                style: kGetStartedButtonText, // Style for the data
              ),
              SizedBox(height: 10), // Add some spacing between data and additional text
              Text(
                unit,
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
