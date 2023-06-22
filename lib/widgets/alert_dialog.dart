import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlertDialogWidget extends StatelessWidget {
  final String? contentText;
  final void Function()? confirmFunction;
  final void Function()? declineFunction;

  const AlertDialogWidget({super.key, 
    this.contentText,
    this.confirmFunction,
    this.declineFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        contentText!,
      ),
      actions: [
        TextButton(
          onPressed: declineFunction,
          child:  Text("21".tr,
          style: const TextStyle(
            fontSize: 18
          ),),
        ),
        TextButton(
          onPressed: confirmFunction,
          child:  Text("20".tr,
          style: const TextStyle(
            fontSize: 18
          ),
          ),
        ),
      ],
    );
  }
}