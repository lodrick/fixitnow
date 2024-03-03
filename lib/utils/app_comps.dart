import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppComps {
  Widget buildText(String text, MaterialColor colors) => Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24.sp,
            color: colors,
          ),
        ),
      );

  static List<String> suggestions = [
    'Afghanistan',
    'Turkey',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'United Kingdom',
    'United States',
    'Canada',
    'Australia',
    'New Zealand',
    'India',
    'Indonesia',
    'Bangladesh',
    'Sri Lanka',
  ];
}
