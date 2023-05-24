import 'package:flutter/material.dart';

import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMeals.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        margin: EdgeInsets.all(7),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: Theme.of(context).textTheme.bodyLarge?.fontWeight,
              fontFamily: Theme.of(context).textTheme.bodyLarge?.fontFamily),
        ),
      ),
    );
  }
}
