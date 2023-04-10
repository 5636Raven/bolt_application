import 'package:bolt_app/models/battery_capacity_current.dart';

import 'voltage.dart';
import 'battery_capacity.dart';
import 'current.dart';

import 'metric.dart';

class Record {
  final DateTime _createdAt;
  final Voltage _voltage;
  final Current _current;
  final BatteryCapacity _batteryCapacity;
  final BatteryCapacityCurrent _batteryCapacityCurrent;

  Record(this._createdAt, this._voltage, this._current,
      this._batteryCapacityCurrent, this._batteryCapacity);

  factory Record.fromJson(Map<String, dynamic> json) {
    DateTime time = DateTime.parse(json["createdAt"]).toLocal();
    Voltage voltage = Voltage.fromJson(json);
    Current current = Current.fromJson(json);

    BatteryCapacity batteryCapacity = BatteryCapacity.fromJson(json);
    BatteryCapacityCurrent batteryCapacityCurrent =
        BatteryCapacityCurrent.fromJson((batteryCapacity.value / 100) * 7);

    return Record(time, voltage, current,batteryCapacity as BatteryCapacityCurrent, batteryCapacityCurrent as BatteryCapacity);
  }

  List<Metric> getDataMetrics() {
    return [_voltage, _current, _batteryCapacity, _batteryCapacityCurrent];
  }

  DateTime get createdAt {
    return _createdAt;
  }

  double get voltage {
    return _voltage.value;
  }

  double get current {
    return _current.value;
  }

  double get batteryCapacity {
    return _batteryCapacity.value;
  }
}
