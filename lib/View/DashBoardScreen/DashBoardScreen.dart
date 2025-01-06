import 'package:comic_reading_app/View/Explore/Explore.dart';
import 'package:comic_reading_app/View/Favourite/FavouriteScreen.dart';
import 'package:comic_reading_app/View/HomeScreen/HomeScreen.dart';
import 'package:comic_reading_app/View/Profile/ProfileSreeen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../resources/Color/Colors.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return const   [
      HomeScreen(),
       ExploreScreen(),
      FavouriteScreen(),
      ProfileScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home,size: 33,),
        title: "Home",
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.greyOpacity,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search,size: 30,),
        title: "Explore",
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.greyOpacity,
      ),

      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite,size: 30,),
        title: "Favourite",
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.greyOpacity,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person,size: 30,),
        title: "Profile",
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: AppColors.greyOpacity,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        navBarStyle: NavBarStyle.style6,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
      ),
    );
  }
}