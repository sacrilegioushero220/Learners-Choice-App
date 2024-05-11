import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/presentation/home/docs_screen.dart';
import 'package:learners_choice_app/presentation/home/home_screen.dart';
import 'package:learners_choice_app/presentation/home/info_screen.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> screens = [
    const HomeScreen(),
    const DocsScreen(),
    const InfoScreen(),
  ];
  int _selectedIndex = 0;
  bool canPop = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _canPop() {
    if (_selectedIndex > 0) {
      return false;
    } else if (_selectedIndex == 0) {
      return true;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _canPop(),
      onPopInvoked: (canPop) {
        if (_selectedIndex > 0) {
          setState(() {
            _selectedIndex = 0;
          });
        } else if (_selectedIndex == 0) {
          exit(0);
        }
      },
      child: Scaffold(
        backgroundColor: context.onPrimary,
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: context.surfaceVariant,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: "Docs",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_outlined),
              label: "info",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
