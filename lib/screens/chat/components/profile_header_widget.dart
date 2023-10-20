import 'package:fixitnow/screens/notification/components/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.size,
  });
  final String imageUrl;
  final String name;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height.h * 0.093,
      padding: const EdgeInsets.all(16.0).copyWith(left: 0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleButton(
                  press: () {
                    Navigator.of(context).pop();
                  },
                  size: size,
                  height: 28.0,
                  width: 28.0,
                  assetsUrl: 'assets/icons/icon-back.png',
                ),
                CircleAvatar(
                  radius: 19.r,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                SizedBox(width: 8.0.w),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 4.w),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.video_chat,
                      size: 18.sp,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
