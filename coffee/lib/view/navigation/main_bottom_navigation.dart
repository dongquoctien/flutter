import 'package:coffee/view/user/screens/user_list_screen.dart';
import 'package:flutter/material.dart';

import '../home/screen/home_screen.dart';

class AppMainBottomNavigation extends StatefulWidget {
  const AppMainBottomNavigation({super.key});

  @override
  State<AppMainBottomNavigation> createState() =>
      _AppMainBottomNavigationState();
}

class _AppMainBottomNavigationState extends State<AppMainBottomNavigation> {
  int _currentIndex = 0;
  static const double _size = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        // selectedItemColor: appColorPrimary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontSize: 15),
        unselectedLabelStyle: const TextStyle(fontSize: 15),
        items: getBootomNavigationBars,
      ),
      body: getScreenPages[_currentIndex],
    );
  }

  List<BottomNavigationBarItem> get getBootomNavigationBars {
    return const [
      BottomNavigationBarItem(
        // activeIcon: Icon(Icons.home, color: appColorPrimary),
        icon: Icon(
          Icons.home_outlined,
          size: _size,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        //activeIcon: Icon(Icons.coffee, color: appColorPrimary),
        //icon: Badge(child: Icon(Icons.notifications_sharp)),
        icon: Icon(
          Icons.local_cafe_outlined,
          size: _size,
        ),
        label: 'Products',
      ),
      BottomNavigationBarItem(
        // icon: Badge(
        //   label: Text('2'),
        //   child: Icon(Icons.messenger_sharp),
        // ),
        // activeIcon: Icon(Icons.location_on, color: appColorPrimary),
        icon: Icon(
          Icons.location_on_outlined,
          size: _size,
        ),
        label: 'Locations',
      ),
      BottomNavigationBarItem(
        icon: Badge(
          label: Text('3'),
          child: Icon(
            Icons.mail_outlined,
            size: _size,
          ),
        ),
        // activeIcon: Badge(
        //     label: Text("2"),
        //     child: Icon(Icons.mail_outlined, color: appColorPrimary)),
        label: 'Mail',
      ),
      BottomNavigationBarItem(
        // activeIcon: Icon(Icons.account_circle, color: appColorPrimary),
        icon: Icon(
          Icons.account_circle_outlined,
          size: _size,
        ),
        label: 'Account',
      ),
    ];
  }

  List<Widget> get getScreenPages {
    return <Widget>[
      /// Home page
      const HomeScreen(),

      /// Products page
      const Center(
        child: Card(
          child: Text("Product Page"),
        ),
      ),

      /// Locations page
      const Center(
        child: const Card(
          child: Text("Locations Page"),
        ),
      ),

      /// Email page
      const Center(
        child: Card(
          child: Text("Email Page"),
        ),
      ),

      /// Account page
      // const Center(
      //   child: Card(
      //     child: Text("Account Page"),
      //   ),
      // ),
      const UserListScreen()
    ];
  }
}
