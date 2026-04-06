import 'package:flutter/material.dart';

import 'category_data.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryData categoryData; // 👈 استقبل الكائن
  final int categoryDataIndex;
  final Function(CategoryData) onSelectedCategory;

  CategoryWidget({
    required this.categoryData,
    required this.categoryDataIndex,
    required this.onSelectedCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: () {
        onSelectedCategory(categoryData); // 👈 دلوقتي معرف تمام
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryData.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(categoryDataIndex % 2 == 0 ? 20 : 0),
            bottomRight: Radius.circular(categoryDataIndex % 2 != 0 ? 20 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(categoryData.image),
            Text(
              categoryData.categoryID,
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
