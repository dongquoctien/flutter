import 'package:coffee/core/app_style.dart';
import 'package:flutter/material.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    const destinations = const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(Icons.home, color: appTextColorPrimary),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      NavigationDestination(
        selectedIcon: Icon(Icons.coffee, color: appTextColorPrimary),
        //icon: Badge(child: Icon(Icons.notifications_sharp)),
        icon: Icon(Icons.coffee_outlined),
        label: 'Products',
      ),
      NavigationDestination(
        // icon: Badge(
        //   label: Text('2'),
        //   child: Icon(Icons.messenger_sharp),
        // ),
        selectedIcon: Icon(Icons.location_on, color: appTextColorPrimary),
        icon: Icon(Icons.location_on_outlined),
        label: 'Locations',
      ),
      NavigationDestination(
        icon: Badge(
          label: Text('3'),
          child: Icon(Icons.mail_outlined),
        ),
        selectedIcon: Badge(
            label: Text("2"),
            child: Icon(Icons.mail_outlined, color: appTextColorPrimary)),
        label: 'Mail',
      ),
      NavigationDestination(
        selectedIcon: Icon(Icons.account_circle, color: appTextColorPrimary),
        icon: Icon(Icons.account_circle_outlined),
        label: 'Account',
      ),
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            // color: appColorPrimary,
          ),
        )),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: appColorPrimary,
          selectedIndex: currentPageIndex,
          destinations: destinations,
        ),
      ),
      body: getScreenPages[currentPageIndex],
    );
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
      const Card(
        child: Text("Product Page"),
      ),

      /// Locations page
      const Card(
        child: Text("Locations Page"),
      ),

      /// Email page
      const Card(
        child: Text("Email Page"),
      ),

      /// Account page
      const Card(
        child: Text("Account Page"),
      ),
    ];
  }
}
