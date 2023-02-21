import 'dart:async';
import 'dart:ffi';

import 'package:flutter/services.dart';
import 'package:flutter/src/services/platform_channel.dart';

class DataService {
  final methodChannel = const MethodChannel("com.example.asset_variation/channel");

  final StreamController<Data> _dataStreamController = StreamController<Data>();

  Stream<Data> get dataStream => _dataStreamController.stream;
  Future<void> startActivity() async {
    try {
      await methodChannel.invokeMethod('startActivity');
    } on PlatformException catch (e)
    {}
  }
  DataService() {
    methodChannel.setMethodCallHandler((call) async {
      if (call.method == "sendData") {
        _dataStreamController.add(Data.fromMap(call.arguments));
      } else {
        print("Method not implemented: ${call.method}");
      }
    });
  }
}

class Data {
  bool? choose;
  Data({
    this.choose,
  });
  Data.fromMap(map) {
    choose = map['choose'];
  }
}
