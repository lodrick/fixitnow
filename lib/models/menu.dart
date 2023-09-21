import 'package:fixitnow/screens/chat/chat.dart';
import 'package:fixitnow/screens/entryPoint/entry_point.dart';
import 'package:fixitnow/screens/home/home_screen.dart';
import 'package:fixitnow/screens/notification/notification.dart';
import 'package:fixitnow/screens/profile/profile_screen.dart';
import 'package:fixitnow/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;
  final Widget widget;

  Menu({
    required this.widget,
    required this.title,
    required this.rive,
  });
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: "HOME",
      stateMachineName: "HOME_interactivity",
    ),
    widget: const EntryPoint(widget: HomeScreen()),
  ),
  Menu(
      title: "Search",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity",
      ),
      widget: const EntryPoint(widget: SearchScreen())),
  Menu(
      title: "Favorites",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity",
      ),
      widget: const EntryPoint(widget: HomeScreen())),
  Menu(
      title: "Help",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity",
      ),
      widget: const EntryPoint(widget: HomeScreen())),
];
List<Menu> sidebarMenus2 = [
  Menu(
      title: "History",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity",
      ),
      widget: const HomeScreen()),
  Menu(
      title: "Notifications",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity",
      ),
      widget: const HomeScreen()),
];

List<Menu> bottomNavItems = [
  Menu(
      title: "Home",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity",
      ),
      widget: const HomeScreen()),
  Menu(
      title: "Search",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity",
      ),
      widget: const SearchScreen()),
  Menu(
      title: "Chat",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity",
      ),
      widget: const ChatScreen()),
  Menu(
      title: "Notification",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity",
      ),
      widget: const NotificationScreen()),
  Menu(
      title: "Profile",
      rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity",
      ),
      widget: const ProfileScreen()),
];
