import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(
                  id: e.id,
                  color: e.color,
                  title: e.title,
                ))
            .toList());
  }
}
