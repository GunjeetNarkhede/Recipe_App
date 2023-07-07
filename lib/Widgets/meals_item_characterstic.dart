import 'package:flutter/material.dart';

class MealsItemType extends StatelessWidget {
  const MealsItemType({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(context) {
    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 17,
            color: Colors.white,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
