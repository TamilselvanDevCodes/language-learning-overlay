import 'dart:developer';

import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OverlayService {
  OverlayService._();

  static final OverlayService instance = OverlayService._();

  /// Check if overlay permission is granted
  Future<bool> isPermissionGranted() async {
    return await FlutterOverlayWindow.isPermissionGranted();
  }

  Future<bool> handlePermission() async {
    bool isPermissionGiven = await isPermissionGranted();
    if (isPermissionGiven) {
      return true;
    } else {
      return (await requestPermission()) ?? false;
    }
  }

  /// Request overlay permission
  Future<bool?> requestPermission() async {
    return await FlutterOverlayWindow.requestPermission();
  }

  /// Open overlay
  Future<void> showOverlay({
    int height = 120,
    int width = 120,
    OverlayAlignment alignment = OverlayAlignment.center,
    PositionGravity positionGravity = PositionGravity.none,
    OverlayPosition? startPosition,
  }) async {
    await FlutterOverlayWindow.showOverlay(
      height: height,
      width: width,
      enableDrag: true,
      overlayTitle: "Lens Translate",
      overlayContent: "Tap to Translate",
      flag: OverlayFlag.defaultFlag,
      visibility: NotificationVisibility.visibilityPublic,
      alignment: alignment,
      positionGravity: positionGravity,
      startPosition: startPosition,
    );
  }

  /// Close overlay
  Future<void> closeOverlay() async {
    await FlutterOverlayWindow.closeOverlay();
  }

  /// Send data to overlay
  Future<void> sendData(dynamic data) async {
    await FlutterOverlayWindow.shareData(data);
  }

  /// Listen for overlay events
  Stream<dynamic> get overlayStream => FlutterOverlayWindow.overlayListener;

  /// Update overlay flag
  Future<void> updateFlag(OverlayFlag flag) async {
    await FlutterOverlayWindow.updateFlag(flag);
  }

  /// Resize overlay
  Future<void> resizeOverlay(int width, int height) async {
    await FlutterOverlayWindow.resizeOverlay(width, height, true);
  }

  /// Move overlay
  Future<bool?> moveOverlay(double x, double y) async {
    return await FlutterOverlayWindow.moveOverlay(OverlayPosition(x, y));
  }

  /// Get current overlay position
  Future<OverlayPosition> getOverlayPosition() async {
    return await FlutterOverlayWindow.getOverlayPosition();
  }

  /// Attach debug listener (optional)
  void attachDebugListener() {
    overlayStream.listen((event) {
      log("Overlay Event: $event");
    });
  }
}
