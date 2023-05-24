import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordance affordance;
  const MealItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordance,
      required this.id});
  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else if (complexity == Complexity.Challaging) {
      return 'Challaging';
    }
    return 'Unknown';
  }

  String get affordenceText {
    if (affordance == Affordance.Cheap) {
      return 'Cheap';
    } else if (affordance == Affordance.Normal) {
      return 'Normal';
    } else if (affordance == Affordance.Expensive) {
      return 'Expensive';
    }
    return 'Unknown';
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  color: Colors.black54,
                  width: 300,
                  child: Text(title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$duration min')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text('$complexityText ')
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text(' $affordenceText ')
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
