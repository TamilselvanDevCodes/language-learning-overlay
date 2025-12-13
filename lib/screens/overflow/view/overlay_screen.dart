import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';

class OverlayScreen extends StatefulWidget {
  const OverlayScreen({super.key});

  @override
  State<OverlayScreen> createState() => _OverlayScreenState();
}

class _OverlayScreenState extends State<OverlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(SizeConstants.s16),
        child: Column(children: []),
      ),
    );
  }
}
