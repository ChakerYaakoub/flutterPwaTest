import 'package:flutter/material.dart';

abstract class Palette {
  static const blue = Color(0xff264653);
  static const green = Color(0xff2a9d8f);
  static const yellow = Color(0xffe9c46a);
  static const orange = Color(0xfff4a261);
  static const red = Color(0xffe76f51);

  static const colors = [blue, green, yellow, orange, red];

  static final greys = [
    Colors.grey.shade200,
    Colors.grey.shade300,
    Colors.grey.shade400,
    Colors.grey.shade500,
    Colors.grey.shade600,
  ];
}
