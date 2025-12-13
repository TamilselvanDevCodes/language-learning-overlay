import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/theme/theme.dart';
import 'package:language_learning_overlay/core/utils/global_variables.dart';
import 'package:language_learning_overlay/routes/navigation/route_constants.dart';
import 'package:language_learning_overlay/routes/navigation/route_navigation.dart';
import 'package:language_learning_overlay/screens/error/error_screen.dart';

void main() {
  runApp(const LanguageLearningApp());
}

class LanguageLearningApp extends StatelessWidget {
  const LanguageLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: WordConstants.wAppName,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: snackBarKey,
      navigatorKey: navigatorKey,
      initialRoute: RouteConstants.rSplashScreen,
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: (_) => MaterialPageRoute(
        builder: (_) => const ErrorScreen(),
      ),
      theme: MyThemeData.getThemeDataLight(),
    );
  }
}
