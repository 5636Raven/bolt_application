import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:bolt_app/widgets/widgets.dart';
import 'package:bolt_app/utils/constants.dart';
import 'package:bolt_app/screens/sign_in_screen.dart';
import 'package:firebase_database/firebase_database.dart'; // Import the Firebase Database package

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static const String _quip = 'Bolt Metrics';

  final DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('power_data').child('Percent');

  // Function to handle the logout action
  void _logout() {
    // Perform any necessary cleanup or logout logic here
    // Navigate back to the sign-in screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _quip,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(_quip),
          backgroundColor: kThemeTertiaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(42),
              bottomRight: Radius.circular(42),
            ),
          ),
          actions: [
            IconButton(
              onPressed: _logout,
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Align widgets in the center
    children: <Widget>[
      SizedBox(height: 16), // Add some space at the top
      CircularIndicator(databaseReference: databaseReference),
      SizedBox(height: 16), // Add some space between CircularIndicator and ElevatedCardExample2
      ElevatedCardExample2(),
      SizedBox(height: 16), // Add some space between ElevatedCardExample2 and ElevatedCardExample
      ElevatedCardExample(),
      SizedBox(height: 16), // Add some space at the bottom
    ],
  ),
),

    )
    );
  }
}

class CircularIndicator extends StatefulWidget {
  final DatabaseReference databaseReference;

  const CircularIndicator({Key? key, required this.databaseReference}) : super(key: key);

  @override
  _CircularIndicatorState createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  late double percent = 0.0; // Initialize with a default value

  @override
  void initState() {
    super.initState();
    // Listen to changes in the database and update the UI
    widget.databaseReference.onValue.listen((event) {
      final data = event.snapshot.value;
      if (data != null) {
        setState(() {
          percent = double.tryParse(data.toString()) ?? 0.0;
          // Ensure the percent value is within the valid range (0.0 to 1.0)
          percent = percent.clamp(0.0, 1.0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 100.0,
      lineWidth: 13.0,
      animation: true,
      percent: percent,
      center: Text(
        "${(percent * 100).toStringAsFixed(0)}%",
        style: kLogInScreenHeadingText,
      ),
      footer: const Text(
        "Charging Percentage",
        style: kLogInScreenHeadingText,
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: const Color.fromARGB(255, 6, 66, 131),
    );
  }
}
