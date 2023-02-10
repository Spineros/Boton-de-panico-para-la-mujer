import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:boton_de_panico/NavBar/screens/account.dart';
import 'package:boton_de_panico/NavBar/screens/home.dart';
import 'package:boton_de_panico/NavBar/screens/settings.dart';
import 'package:boton_de_panico/NavBar/screens/button.dart';

void main() => runApp(NavBar());

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State createState() {
    return _NavBar();
  }
}

class _NavBar extends State {
  Widget? _child;

  @override
  void initState() {
    _child = const HomeContent();
    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        extendBody: true,
        body: _child,
        bottomNavigationBar: FluidNavBar(
          icons: [
            FluidNavBarIcon(
                icon: Icons.home,
                backgroundColor: Color.fromARGB(255, 103, 63, 196),
                extras: {"label": "home"}),
            FluidNavBarIcon(
                icon: Icons.safety_check,
                backgroundColor: Color.fromARGB(255, 103, 63, 196),
                extras: {"label": "account"}),
            FluidNavBarIcon(
                icon: Icons.account_box,
                backgroundColor: Color.fromARGB(255, 103, 63, 196),
                extras: {"label": "settings"}),
            FluidNavBarIcon(
                icon: Icons.settings,
                backgroundColor: Color.fromARGB(255, 103, 63, 196),
                extras: {"label": "settings"}),
          ],
          onChange: _handleNavigationChange,
          style: FluidNavBarStyle(
              barBackgroundColor: Color.fromARGB(255, 252, 156, 79),
              iconSelectedForegroundColor: Color.fromARGB(255, 255, 255, 255),
              iconUnselectedForegroundColor:
                  Color.fromARGB(136, 255, 255, 255)),
          scaleFactor: 1.5,
          defaultIndex: 0,
          itemBuilder: (icon, item) => Semantics(
            label: icon.extras!["label"],
            child: item,
          ),
        ),
      ),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = ButtonContent();
          break;
        case 2:
          _child = AccountContent();
          break;
        case 3:
          _child = SettingsContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
