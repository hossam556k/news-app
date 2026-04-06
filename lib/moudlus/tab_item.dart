import 'package:flutter/material.dart';
import 'package:newsapp/core/color-pattles.dart';
import 'package:newsapp/moudlus/source_data.dart';

class TabItem extends StatelessWidget {
  final Sources source;
  final bool isSelected;

  const TabItem({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300), // مدة الأنيمشن
      curve: Curves.easeInOut, // نوع الأنيمشن
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? ColorPalette.primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        source.name,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
