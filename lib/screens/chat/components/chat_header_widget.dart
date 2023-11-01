import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/chat/components/chat_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatHeaderWidget extends StatelessWidget {
  const ChatHeaderWidget({
    super.key,
    required this.currentUser,
    required this.size,
  });
  final Size size;
  final UserModel currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width.w * 0.015,
        vertical: size.height.h * 0.00,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 27.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ChatRoundButton(press: () {}, iconData: Icons.add, size: size),
              SizedBox(
                width: size.width.w * 0.03,
              ),
              ChatRoundButton(
                  press: () {},
                  iconData: Icons.stay_primary_landscape_rounded,
                  size: size),
            ],
          ),
        ],
      ),
    );
  }
}
