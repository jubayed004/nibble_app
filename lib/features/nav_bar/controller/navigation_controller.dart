import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nibble_app/features/explores/view/explores_screen.dart';
import 'package:nibble_app/features/games/view/games_screen.dart';
import 'package:nibble_app/features/home/home_screen.dart';
import 'package:nibble_app/features/profile/profile_screen.dart';

final navigationProvider = StateNotifierProvider<NavigationNotifier, int>(
  (ref) => NavigationNotifier(),
);

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);

  void setNavIndex(int index) {
    state = index;
  }

  List<Widget> getPages() {
    return [
      const HomeScreen(),
      const ExploresScreen(),
      const GamesScreen(),
      const ProfileScreen(),
    ];
  }

  // List of SVG icon asset paths for the navigation bar
  final List<IconData> icons = [
    Iconsax.home,
    Iconsax.search_favorite,
    Iconsax.game,
    Iconsax.user,
  ];

  // List of labels for the navigation bar
  final List<String> labels = ["Home", "Explore", "Games", "Account"];
}
