import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/routes/navigation/route_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, RouteConstants.rDashboardScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: SizeConstants.s30,
          width: SizeConstants.s30,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
