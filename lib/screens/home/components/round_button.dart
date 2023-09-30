import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback press;
  final String riveAssetsUrl;
  final Size size;
  const RoundButton({
    super.key,
    required this.press,
    required this.size,
    required this.riveAssetsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.006,
          ),
          height: 40.h,
          width: 40.w,
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
          child: SvgPicture.asset(
            riveAssetsUrl,
            fit: BoxFit.fill,
            height: 6.h,
            width: 6.w,
          ),
        ),
      ),
    );
  }
}
