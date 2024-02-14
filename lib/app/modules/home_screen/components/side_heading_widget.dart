import 'package:flutter/material.dart';

class SideHeadingWidget extends StatelessWidget {
  const SideHeadingWidget(
      {super.key, required this.icon, required this.sideHeading});

  final IconData icon;
  final String sideHeading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), const SizedBox(width: 10), Text(sideHeading)],
    );
  }
}
