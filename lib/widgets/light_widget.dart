import 'package:flutter/material.dart';

class LightWidget extends StatelessWidget {
  final Color lightColor;
  final bool isActive;
  const LightWidget({
    super.key,
    required this.lightColor,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: isActive ? lightColor : Colors.blueGrey.shade100,
        ),
      ),
    );
  }
}
