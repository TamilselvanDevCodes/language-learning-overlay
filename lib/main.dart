import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/theme/theme.dart';
import 'package:language_learning_overlay/core/utils/global_variables.dart';
import 'package:language_learning_overlay/routes/navigation/route_constants.dart';
import 'package:language_learning_overlay/routes/navigation/route_navigation.dart';
import 'package:language_learning_overlay/screens/error/error_screen.dart';
import 'package:language_learning_overlay/screens/overflow/view/overlay_screen.dart';

final ReceivePort mainPort = ReceivePort();
MethodChannel _channel = MethodChannel('lens_bridge');

Future<void> _startLensFromMainThread() async {
  await _channel.invokeMethod('startLens');
}

void main() {
  debugPrint("🔥 MAIN APP STARTED");
  WidgetsFlutterBinding.ensureInitialized();
  IsolateNameServer.registerPortWithName(mainPort.sendPort, 'main_port');

  mainPort.listen((message) {
    if (message == 'START_LENS') {
      _startLensFromMainThread();
    }
  });
  runApp(const LanguageLearningApp());
}

class LanguageLearningApp extends StatefulWidget {
  const LanguageLearningApp({super.key});

  @override
  State<LanguageLearningApp> createState() => _LanguageLearningAppState();
}

class _LanguageLearningAppState extends State<LanguageLearningApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: WordConstants.wAppName,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackBarKey,
      navigatorKey: navigatorKey,
      initialRoute: RouteConstants.rSplashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: (_) =>
          MaterialPageRoute(builder: (_) => const ErrorScreen()),
      theme: MyThemeData.getThemeDataLight(),
    );
  }
}

// overlay entry point
@pragma("vm:entry-point")
void overlayMain() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: OverlayScreen()),
  );
}
