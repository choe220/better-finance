import 'package:better_finance/views/budget_page.dart';
import 'package:better_finance/views/graph_page.dart';
import 'package:better_finance/views/landing_page.dart';
import 'package:better_finance/views/settings_page.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    LandingPage(),
    BudgetPage(),
    GraphPage(),
    SettingsPage(),
  ];

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) => _pageChanged(index),
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Budget',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up),
              label: 'Graph',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _navItemTapped,
        ),
      ),
    );
  }
}
