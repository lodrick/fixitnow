import 'package:fixitnow/models/user.dart';
import 'package:fixitnow/screens/chat/components/chat_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatHeaderWidget extends StatelessWidget {
  const ChatHeaderWidget({
    super.key,
    required this.users,
    required this.currentUserId,
    required this.size,
  });
  final List<UserModel> users;
  final Size size;
  final int currentUserId;

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
            crossAxisAlignment: CrossAxisAlignment.start,
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

          /*SizedBox(
            height: size.height.h * 0.087,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Set<RoleModel> setRole = {};
                final user = users.isNotEmpty
                    ? users[index]
                    : UserModel(1, '_name', '_surname', '_about', '_email',
                        '_photoUrl', '_phoneNumber', setRole);
                if (currentUserId == user.getUserId) {
                  return const SizedBox.shrink();
                } else {
                  return Container(
                    margin: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () {
                        debugPrint(user.getAbout);
                      },
                      child: CircleAvatar(
                        radius: 24.r,
                        backgroundImage: const NetworkImage(
                            'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png'),
                      ),
                    ),
                  );
                }
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
