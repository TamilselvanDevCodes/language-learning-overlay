import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/services.dart';

final ReceivePort mainPort = ReceivePort();
MethodChannel _channel = MethodChannel('lens_bridge');

void initIsolateConnection(){
  IsolateNameServer.registerPortWithName(mainPort.sendPort, 'main_port');

  mainPort.listen((message) {
    if (message == 'START_LENS') {
      _startLensFromMainThread();
    }
  });
}

Future<void> _startLensFromMainThread() async {
  await _channel.invokeMethod('startLens');
}


