import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final int currentIndex;

  const Navigation({super.key, required this.currentIndex});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    String routeName;
    switch (index) {
      case 0:
        routeName = '/dashboard';
        break;
      case 1:
        routeName = '/search';
        break;
      case 2:
        routeName = '/schedule';
        break;
      case 3:
        routeName = '/messages';
        break;
      case 4:
        routeName = '/profile';
        break;
      default:
        return;
    }

    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onTabTapped,
      currentIndex: currentIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search_outlined),
          activeIcon: Icon(Icons.search),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          activeIcon: Icon(Icons.calendar_today),
          label: "Schedule",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_outlined),
          activeIcon: Icon(Icons.message),
          label: "Messages",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          activeIcon: Icon(Icons.person),
          label: "Me",
        ),
      ],
    );
  }
}
