import 'dart:io';

import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/widgets/app_bars.dart';
import 'package:language_learning_overlay/platform_service/overlay_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  /// Overlay permission
  Future<void> _checkPermissions() async {
    if (!Platform.isAndroid) return;
    await OverlayService.instance.handlePermission();
  }

  Future<void> _startOverlay() async {
    await OverlayService.instance.showOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.getAppBar(title: WordConstants.wDashboard),
      body: Padding(
        padding: const EdgeInsets.all(SizeConstants.s16),
        child: Column(
          children: [
            TextButton(onPressed: _startOverlay, child: Text("Start Overlay")),
          ],
        ),
      ),
    );
  }
}
