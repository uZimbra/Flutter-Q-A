import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final void Function() onPress;

  const Answer({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }
}
