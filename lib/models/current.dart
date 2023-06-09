import 'package:bolt_app/models/metric.dart';

class Current extends Metric {
  Current({parameter, value, units}) : super(parameter, value, units);

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
        parameter: "Current",
        value: (json.containsKey("current")) ? json['current'].toDouble() : 0.0,
        units: "Amps");
  }
}
