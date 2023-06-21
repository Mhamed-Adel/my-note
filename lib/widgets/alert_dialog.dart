import 'package:flutter/material.dart';

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
          child: const Text("No"),
        ),
        TextButton(
          onPressed: confirmFunction,
          child: const Text("Yes"),
        ),
      ],
    );
  }
}