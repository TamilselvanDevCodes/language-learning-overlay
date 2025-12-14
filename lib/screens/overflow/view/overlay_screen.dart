import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/theme/text_style.dart';

class OverlayScreen extends StatefulWidget {
  const OverlayScreen({super.key});

  @override
  State<OverlayScreen> createState() => _OverlayScreenState();
}

class _OverlayScreenState extends State<OverlayScreen> {
  String? recognizedText;

  @override
  void initState() {
    super.initState();

    // 📩 Listen text from native Android
    // _channel.setMethodCallHandler((call) async {
    //   if (call.method == 'onTextSelected') {
    //     final String text = call.arguments as String;
    //     debugPrint("🇯🇵 Text from native: $text");
    //
    //     setState(() {
    //       recognizedText = text;
    //     });
    //   }
    // });
  }

  void overlayEntryPoint() {
    final SendPort? mainPort = IsolateNameServer.lookupPortByName('main_port');

    mainPort?.send('START_LENS');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () async {
          overlayEntryPoint();
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.translate_outlined,
                color: Colors.white,
                size: SizeConstants.s32,
              ),

              if (recognizedText != null) ...[
                const SizedBox(height: SizeConstants.s8),
                Text(
                  recognizedText!,
                  style: getTextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
