import 'package:flutter/material.dart';

class iconContent extends StatelessWidget {
  iconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: Icon(
            icon,
            size: 70,
          ),
        ),
        Text(
          label,
          style:TextStyle(fontSize: 20, color: Color(0xFF8D8E98)),
        ),
      ],
    );
  }
}