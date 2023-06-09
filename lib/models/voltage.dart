import 'package:bolt_app/models/metric.dart';

class Voltage extends Metric {
  Voltage({parameter, value, units}) : super(parameter, value, units);

  factory Voltage.fromJson(Map<String, dynamic> json) {
    return Voltage(
        parameter: "Voltage",
        value: (json.containsKey("voltage")) ? json['voltage'].toDouble() : 0.0,
        units: "Volts");
  }
}
