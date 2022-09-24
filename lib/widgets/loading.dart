import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:offres_onlines/config/theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Center(
        child: SpinKitPulse(
          color: PRIMARY_COLOR,
          size: 60.0,
        ),
      ),
    );
  }
}
