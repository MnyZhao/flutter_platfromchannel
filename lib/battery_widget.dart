import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryWidget> {
  String _batteryLevel = 'Battery level: unknown.';
  static const MethodChannel methodChannel = MethodChannel('BATTERY_CHANNEL');

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_batteryLevel),
          RaisedButton(
            child: const Text('Refresh'),
            onPressed: _getBatteryLevel,
          ),
        ],
      ),
    );
  }
}
