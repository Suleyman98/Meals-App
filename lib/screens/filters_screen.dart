import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  final Function saveFilters;
  final Map<String, bool> filters;
  FilterScreen(this.saveFilters, this.filters);
  static const routeName = '/filter';

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _vegetarian = false;
  bool _isVegan = false;
  bool _isLactoseFre = false;

  @override
  initState() {
    _isGlutenFree = widget.filters['gluten']!;
    _vegetarian = widget.filters['vegatarian']!;
    _isVegan = widget.filters['vegan']!;
    _isLactoseFre = widget.filters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final filter = {
                    'gluten': _isGlutenFree,
                    'lactose': _isLactoseFre,
                    'vegan': _isVegan,
                    'vegatarian': _vegetarian,
                  };
                  widget.saveFilters(filter);
                })
          ],
          title: Text('Your filters'),
        ),
        drawer: Drawer(child: MainDrawer()),
        body: Column(
          children: [
            Container(
              child:
                  Text('Adjust Meals', style: TextStyle(color: Colors.black)),
              padding: EdgeInsets.all(20),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text('Gluten-free'),
                    value: _isGlutenFree,
                    subtitle: Text('Only include Gluten-Free Meals'),
                    onChanged: (val) {
                      _isGlutenFree = val;
                      setState(() {});
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: Text('Only include Vegetarian Meals'),
                    onChanged: (val) {
                      _vegetarian = val;
                      setState(() {});
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: _isVegan,
                    subtitle: Text('Only include Vegan Meals'),
                    onChanged: (val) {
                      _isVegan = val;
                      setState(() {});
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose-Free'),
                    value: _isLactoseFre,
                    subtitle: Text('Only include Lactose-Free Meals'),
                    onChanged: (val) {
                      _isLactoseFre = val;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
