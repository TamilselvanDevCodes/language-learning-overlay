import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/widgets/app_bars.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.getAppBar(title: WordConstants.wDashboard),
      body: Padding(
        padding: const EdgeInsets.all(SizeConstants.s16),
        child: Column(children: [

        ],),
      ),
    );
  }
}
