import 'package:flutter/material.dart';

class OverlayScreen extends StatefulWidget {
  const OverlayScreen({super.key});

  @override
  State<OverlayScreen> createState() => _OverlayScreenState();
}

class _OverlayScreenState extends State<OverlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {},
        child: Icon(Icons.translate_outlined),
      ),
    );
  }
}
