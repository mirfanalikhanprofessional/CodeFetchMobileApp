import 'package:flutter/material.dart';

class AppConstants{

  static const bool _isMockMode = false;
  static bool get checkIsMockMode => _isMockMode;

  double calculateResponsiveHeight(BuildContext context, double percentage) {
    assert(percentage >= 0 && percentage <= 100, 'Percentage must be between 0 and 100.');
    final screenHeight = MediaQuery.of(context).size.height;
    return (screenHeight * percentage) / 100;
  }
}