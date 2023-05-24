import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegatarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten'] == true && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !element.isVegan) {
          return false;
        }
        if (_filters['vegatarian'] == true && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => mealId == element.id);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return _favoriteMeals.any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold))),
      routes: {
        FilterScreen.routeName: (context) =>
            FilterScreen(_setFilters, _filters),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetailScreen.routName: (context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavorite: isMealFavorite),
        '/': (context) => TabsScreen(favorites: _favoriteMeals)
      },
      initialRoute: '/',
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meals App')),
      body: Categories(),
    );
  }
}
