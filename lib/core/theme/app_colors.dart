import 'package:flutter/material.dart';

const _neutral = <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(0xFFF9FAFC),
  250: Color(0xFFf7f7f8),
  300: Color(0xFFF4F6FA),
  350: Color(0xFFE6E9EC),
  400: Color(0xFFE2E8F0),
  450: Color(0xFFacacac),
  500: Color(0xFF94A3B8),
  600: Color(0xFF8E9DB3),
  700: Color(0xFF475569),
  800: Color(0xFF1E293B),
  900: Color(0xFF0F172A),
};

const _icons = <int, Color>{
  600: Color(0xFF959FAC),
};

const _primary = <int, Color>{
  400: Color(0xFF5C5C5C),
  500: Color(0xFF2F2F2F),
};

const _green = <int, Color>{
  50: Color(0xFFF5FBF8),
  400: Color(0xFF16a34a),
  500: Color(0xFF15803d),
  600: Color(0xFF166534),
};
const _red = <int, Color>{
  50: Color(0xFFFDF4F4),
  400: Color(0xFFD14343),
  500: Color(0xFFA73636),
  600: Color(0xFF7D2828),
};
const _yellow = <int, Color>{
  50: Color(0xFFFFFAF1),
  400: Color(0xFFFFB020),
  500: Color(0xFF996A13),
  600: Color(0xFF66460D),
};
const _blue = <int, Color>{
  50: Color(0xFFF3F6FF),
  400: Color(0xFF3366FF),
  500: Color(0xFF2952CC),
  600: Color(0xFF1F3D99),
};
const _grey = <int, Color>{
  100: Color(0xFFF7F7F8),
  700: Color(0xFF3C4858),
  900: Color(0xFF1F2D3D),
};

const _facebook = <int, Color>{
  100: Color(0xFF4267B2),
};

const _secundary = <int, Color>{
  400: Color(0xFFE1D7C4),
  500: Color(0xFF5C5C5C),
};

abstract class AppColors {
  static const MaterialColor neutral = MaterialColor(0xFFFFFFFF, _neutral);
  static const MaterialColor secundary = MaterialColor(0xFF007BFF, _secundary);
  static const MaterialColor display = MaterialColor(0xFF0F172A, _neutral);
  static const MaterialColor grey = MaterialColor(0xFF1F2D3D, _grey);
  static const MaterialColor primary = MaterialColor(0xFF002F5F, _primary);
  static const MaterialColor green = MaterialColor(0xFF15803d, _green);
  static const MaterialColor red = MaterialColor(0xFFA73636, _red);
  static const MaterialColor yellow = MaterialColor(0xFF996A13, _yellow);
  static const MaterialColor blue = MaterialColor(0xFF2952CC, _blue);
  static const MaterialColor facebook = MaterialColor(0xFF4267B2, _facebook);
  static const MaterialColor buttonTop = MaterialColor(0xFFE1D7C4, _secundary);
  static const MaterialColor icons = MaterialColor(0xFF8E9DB3, _icons);
}
