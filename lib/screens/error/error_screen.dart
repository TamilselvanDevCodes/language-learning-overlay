import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/constants/size_constants.dart';
import 'package:language_learning_overlay/core/constants/word_constants.dart';
import 'package:language_learning_overlay/core/widgets/app_text.dart';
import 'package:language_learning_overlay/routes/navigation/route_constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(SizeConstants.s16),
        child: Column(
          children: [
            AppText(WordConstants.wPageNotFound),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteConstants.rDashboardScreen,
                    );
                  },
                  child: AppText(WordConstants.wBackToHome),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
