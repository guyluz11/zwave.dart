import 'package:zwave/capability/zw_node_mixin.dart';
import 'package:zwave/report/sensor_multilevel_report.dart';

abstract class AirTemperature implements ZwNodeMixin {
  num? temperature;

  @override
  void handleSensorMultilevelAirTemperature(SensorMultilevelReport report) {
    temperature = report.value;
    // convert fahrenheit to celsius
    if (report.scale == 1) temperature = (temperature! - 32) * 5 / 9;
  }
}
