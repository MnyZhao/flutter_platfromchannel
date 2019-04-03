import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platfromchannel/Secends.dart';
import 'package:flutter_platfromchannel/battery_widget.dart';
import 'package:flutter_platfromchannel/batterychange_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter PlatFromChannel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //flutter 通过methodchannel 通知MainActivity去跳转 监听实现方法在MainActivity
  MethodChannel channel_open = MethodChannel("F_N_CHANNEL");

  // 原生跳转到flutter
  MethodChannel channel_flutter = MethodChannel("N_F_CHANNEL");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channel_flutter.setMethodCallHandler((MethodCall call) {
      if (call.method == "goFlutter") {
        _jumpSecend(call.arguments.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BatteryChargeWidget(),
            BatteryWidget(),
            RaisedButton(
                child: Text('Go Secend'), onPressed: _jumpToNativeSecend),
            RaisedButton(
                child: Text('Go Three'), onPressed: _jumpToNativeThree),
            RaisedButton(
                child: Text('Go secend dart'),
                onPressed: () {
                  _jumpSecend("go secends");
                }),
          ],
        ),
      ),
    );
  }

  Future<String> _jumpToNativeSecend() async {
    String result = await channel_open.invokeMethod('goSecendActivity');
    print(result);
  }

  Future<String> _jumpToNativeThree() async {
    Map<String, String> map = {"flutter": "这是一条来自flutter的参数"};

    String result = await channel_open.invokeMethod('goThreeActivity', map);

    print(result);
  }

  void _jumpSecend(Object o) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return Secends(msg:o.toString());
    }));
    print("o:" + o.toString());
  }
}
