import 'dart:math';

import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  final colors =  Colors.accents;
  final Random rand = Random();
  Color getRandomColor(Key key) {
    return  colors[key.hashCode % colors.length].shade700;
  }
}