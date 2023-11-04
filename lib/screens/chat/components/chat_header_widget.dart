import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatHeaderWidget extends StatelessWidget {
  const ChatHeaderWidget({
    super.key,
    required this.size,
    required this.addWidget,
    required this.landscapeWidget,
    required this.titleHeader,
  });
  final Size size;
  final String titleHeader;
  final Widget addWidget;
  final Widget landscapeWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width.w * 0.025,
        vertical: size.height.h * 0.005,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
            child: Text(
              titleHeader,
              style: TextStyle(
                color: Colors.black,
                fontSize: 27.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              addWidget,
              SizedBox(
                width: size.width.w * 0.03,
              ),
              landscapeWidget,
            ],
          ),
        ],
      ),
    );
  }
}
