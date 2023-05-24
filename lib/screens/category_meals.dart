import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/categories';
  final List<Meal> meals;
  const CategoryMeals(this.meals);

  // final String categoryId;
  // final String categoryTitle;
  // const CategoryMeals(
  //     {super.key, required this.categoryId, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'] as String;
    final categoryTitle = routeArgs['title'] as String;
    final categoryMeals = meals
        .where((element) => element.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(title: const Text('Recipes')),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              affordance: categoryMeals[index].affordance,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              id: categoryMeals[index].id,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
