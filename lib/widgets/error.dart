import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String text;
  const Error({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Center(
        child: Container(
          width: 240,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
            color: Colors.red.shade100
          ),
          child: Text(text),
        ),
      ),
    );
  }
}