import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal>? favorites;
  const Favorites({super.key, this.favorites});

  @override
  Widget build(BuildContext context) {
    if (favorites!.isEmpty) {
      return Center(
        child: Text('Favorites'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            affordance: favorites![index].affordance,
            complexity: favorites![index].complexity,
            duration: favorites![index].duration,
            imageUrl: favorites![index].imageUrl,
            title: favorites![index].title,
            id: favorites![index].id,
          );
        },
        itemCount: favorites!.length,
      );
    }
  }
}
