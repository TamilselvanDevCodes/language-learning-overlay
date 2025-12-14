import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/theme/theme.dart';
import 'package:language_learning_overlay/core/utils/global_variables.dart';
import 'package:language_learning_overlay/platform_service/overlay_isolate.dart';
import 'package:language_learning_overlay/routes/navigation/route_constants.dart';
import 'package:language_learning_overlay/routes/navigation/route_navigation.dart';
import 'package:language_learning_overlay/screens/error/error_screen.dart';
import 'package:language_learning_overlay/screens/overflow/view/overlay_screen.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initIsolateConnection();
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
