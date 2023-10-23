import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.press,
    required this.size,
    required this.assetsUrl,
    required this.height,
    required this.width,
    required this.edgeInsets,
  });
  final VoidCallback press;
  final String assetsUrl;
  final Size size;
  final double height, width;
  final EdgeInsets edgeInsets;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: edgeInsets,
          height: height.h,
          width: width.w,
          padding: EdgeInsets.symmetric(
            horizontal: 7.5.w,
            vertical: 7.5.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: const Offset(0, 3),
                blurRadius: 8.r,
              ),
            ],
          ),
          child: Image.asset(
            assetsUrl,
            fit: BoxFit.fill,
            height: 6.h,
            width: 6.h,
          ),
        ),
      ),
    );
  }
}
