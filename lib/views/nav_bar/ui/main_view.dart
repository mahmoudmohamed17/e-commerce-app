import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String id = Routes.mainView;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    Text('Home'),
    Text('Favorites'),
    Text('Search'),
    Text('Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: GNav(
        selectedIndex: _currentIndex,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        rippleColor: Colors.grey[800]!,
        hoverColor: Colors.grey[700]!,
        tabBorderRadius: 15,
        curve: Curves.easeOutExpo,
        duration: const Duration(milliseconds: 900),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Colors.white,
        iconSize: 24,
        tabBackgroundColor: AppColors.kPrimaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: const [
          GButton(icon: FontAwesomeIcons.house, text: 'Home'),
          GButton(icon: FontAwesomeIcons.solidHeart, text: 'Favorites'),
          GButton(icon: FontAwesomeIcons.magnifyingGlass, text: 'Search'),
          GButton(icon: FontAwesomeIcons.user, text: 'Profile'),
        ],
      ),
    );
  }
}
