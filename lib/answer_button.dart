import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, this.onTap, {super.key});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromRGBO(241, 77, 255, 0.7),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
