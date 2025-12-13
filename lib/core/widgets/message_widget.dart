import 'package:flutter/material.dart';
import 'package:language_learning_overlay/core/widgets/app_text.dart';

import '../constants/size_constants.dart';

class MessageWidget extends StatelessWidget {
  final String messageImage;
  final String messageContent;

  const MessageWidget({
    super.key,
    required this.messageImage,
    required this.messageContent,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(SizeConstants.s26),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SizeConstants.s8,),
                child: Image.asset(
                  messageImage,
                  width: SizeConstants.s180,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: SizeConstants.s12,),
            AppText(
              messageContent,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConstants.s20,
              ),
            ),
            SizedBox(height: SizeConstants.s12,),
          ],
        ),
      ),
    );
  }
}
