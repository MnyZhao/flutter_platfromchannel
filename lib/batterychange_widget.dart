import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryChargeWidget extends StatefulWidget {
  @override
  _BatteryWidgetState createState() => _BatteryWidgetState();
}

class _BatteryWidgetState extends State<BatteryChargeWidget> {
  String _chargingStatus = 'Battery status: unknown.';
  EventChannel eventChannel = EventChannel("EVENT_CHANNEL");

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
      "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
      print(_chargingStatus);
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_chargingStatus),
        ],
      ),
    );
  }
}
