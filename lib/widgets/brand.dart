import 'package:flutter/material.dart';

class Brand extends StatelessWidget {
  const Brand({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'OFFRES',
            style: TextStyle(color: Colors.grey.shade400,letterSpacing: 2),
          ),
          const Text('ONLINE',style: TextStyle(letterSpacing: 2),)
        ],
      ),
    );
  }
}
