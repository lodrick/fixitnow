import 'package:fixitnow/models/role_model.dart';
import 'package:fixitnow/models/user.dart';
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
        horizontal: size.width.w * 0.01,
        vertical: size.height.h * 0.00,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width.h * 0.75,
            child: Text(
              'Favourites',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: size.height.h * 0.002,
          ),
          SizedBox(
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
          ),
        ],
      ),
    );
  }
}
