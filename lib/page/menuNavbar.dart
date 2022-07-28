import 'package:flutter/material.dart';


class MenuNavbar {
  const MenuNavbar(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<MenuNavbar> allDestinations = <MenuNavbar>[
  MenuNavbar('Proses', Icons.assignment),
  MenuNavbar('History', Icons.access_time),
  MenuNavbar('Akun Saya', Icons.account_box_outlined)
];