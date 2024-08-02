import 'package:coffee/core/app_style.dart';
import 'package:coffee/view/user/screens/user_list_screen.dart';
import 'package:flutter/material.dart';

class AppMainBottomNavigation extends StatefulWidget {
  const AppMainBottomNavigation({super.key});

  @override
  State<AppMainBottomNavigation> createState() =>
      _AppMainBottomNavigationState();
}

class _AppMainBottomNavigationState extends State<AppMainBottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          size: 35,
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        //activeIcon: Icon(Icons.coffee, color: appColorPrimary),
        //icon: Badge(child: Icon(Icons.notifications_sharp)),
        icon: Icon(
          Icons.coffee_outlined,
          size: 35,
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
          size: 35,
        ),
        label: 'Locations',
      ),
      BottomNavigationBarItem(
        icon: Badge(
          label: Text('3'),
          child: Icon(
            Icons.mail_outlined,
            size: 35,
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
          size: 35,
        ),
        label: 'Account',
      ),
    ];
  }

  List<Widget> get getScreenPages {
    return <Widget>[
      /// Home page
      const Center(
        child: Card(
          child: Text("Home Page"),
        ),
      ),

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
