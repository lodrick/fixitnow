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
}
