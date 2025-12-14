import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
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
  void initState() {
    super.initState();
    _checkPermissions();
  }

  /// Overlay permission
  Future<void> _checkPermissions() async {
    if (!Platform.isAndroid) return;

    final hasPermission = await FlutterOverlayWindow.isPermissionGranted();
    if (!hasPermission) {
      await FlutterOverlayWindow.requestPermission();
    }
  }

  Future<void> _startOverlay() async {
    final hasPermission = await FlutterOverlayWindow.isPermissionGranted();
    if (!hasPermission) {
      await FlutterOverlayWindow.requestPermission();
      return;
    }
    await FlutterOverlayWindow.showOverlay(
      height: 120,
      width: 120,
      enableDrag: true,
      overlayTitle: "Lens Translate",
      overlayContent: "Tap to Translate",
      flag: OverlayFlag.defaultFlag,
      visibility: NotificationVisibility.visibilityPublic,
    );
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
