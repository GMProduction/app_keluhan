import 'package:flutter/material.dart';

class MenuNavbar {
  const MenuNavbar(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<MenuNavbar> allDestinations = <MenuNavbar>[
  MenuNavbar('Home', Icons.dashboard),
  MenuNavbar('Proses', Icons.assignment),
  MenuNavbar('History', Icons.access_time),
];
