import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CustomButton1({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black45;
          }
          return Colors.grey;
        }),
      ),
    );
  }
}
