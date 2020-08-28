import 'package:flutter/material.dart';

import './constance.dart' show AppColors;
import './home/homescreen.dart';

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor),
    cardColor: Color(AppColors.AppBarColor)
  ),
  home: HomeScreen(),
));
