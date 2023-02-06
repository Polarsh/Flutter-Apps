// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:cocktails/ui/pages/pages.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _selectedIndex = 0;

  final List<String> _tabsName = [
    "Categories",
    "Cocktails",
    "Ingredients",
  ];

  final List<Widget> _tabs = [
    CategoriesPage(),
    CocktailsPage(),
    IngredientsPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: _tabs[_selectedIndex],
          appBar: AppBar(
            title: Text(_tabsName[_selectedIndex]),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.tag), label: _tabsName[0]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_bar), label: _tabsName[1]),
              BottomNavigationBarItem(
                  icon: Icon(Icons.liquor), label: _tabsName[2]),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
