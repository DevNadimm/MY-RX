import 'package:flutter/material.dart';

class AppBarBottomDivider extends StatelessWidget {
  const AppBarBottomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.5,
      color: Colors.grey.withOpacity(0.3),
    );
  }
}
