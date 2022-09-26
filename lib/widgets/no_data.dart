
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Data/assets.dart';


class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(Assets.noData),
          const SizedBox(height: 10),
          Text('Aucune donnée',style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
    );
  }
}