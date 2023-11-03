import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoundButton extends StatelessWidget {
  const ChatRoundButton({
    super.key,
    required this.press,
    required this.iconData,
    required this.size,
  });
  final VoidCallback press;
  final IconData iconData;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        height: 32.h,
        width: 32.w,
        decoration: BoxDecoration(
          color: CustomColor.primaryColors,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: const Offset(0, 3),
              blurRadius: 8.r,
            ),
          ],
        ),
        child: Icon(
          iconData,
          size: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
