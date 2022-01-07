import 'package:better_finance/budget_page.dart';
import 'package:better_finance/graph_page.dart';
import 'package:better_finance/landing_page.dart';
import 'package:better_finance/settings_page.dart';
import 'package:better_finance/theme.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final int selectedIndex;

  const NavBar({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      switch (index) {
        case 0:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LandingPage(),
            ),
          );
          break;
        case 1:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BudgetPage(),
            ),
          );
          break;
        case 2:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const GraphPage(),
            ),
          );
          break;
        case 3:
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            ),
          );
          break;
      }
    }

    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: CustomColors.lightGreen,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
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
      currentIndex: widget.selectedIndex,
      selectedItemColor: CustomColors.orange,
      onTap: _onItemTapped,
    );
  }
}
