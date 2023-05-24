import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
            color: Colors.amber,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Cooking Up',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.pink,
                  letterSpacing: 2),
            )),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            size: 26,
          ),
          title: const Text(
            'Meals',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(
              '/',
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.filter,
            size: 26,
          ),
          title: const Text(
            'Filters',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/filter');
          },
        ),
      ]),
    );
  }
}
