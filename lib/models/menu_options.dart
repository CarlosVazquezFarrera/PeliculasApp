import 'package:flutter/material.dart';

class MenuOptions {
  MenuOptions({
    required this.route,
    required this.screen,
    this.name,
    this.icon,
  });
  final String route;
  final IconData? icon;
  final String? name;
  final Widget screen;
}
