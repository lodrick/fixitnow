import 'package:fixitnow/models/role_model.dart';
import 'package:fixitnow/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBodyWidget extends StatefulWidget {
  final List<UserModel> users;
  final int currentUserId;
  final Size size;
  const ChatBodyWidget({
    super.key,
    required this.users,
    required this.currentUserId,
    required this.size,
  });

  @override
  State<ChatBodyWidget> createState() => _ChatBodyWidgetState();
}

class _ChatBodyWidgetState extends State<ChatBodyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0.h,
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.r),
          topRight: Radius.circular(25.r),
        ),
      ),
      child: buildChats(),
    );
  }

  Widget buildChats() => ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          Set<RoleModel> setRole = {};
          final user = widget.users.isNotEmpty
              ? widget.users[index]
              : UserModel(1, '_name', '_surname', '_about', '_email',
                  '_photoUrl', '_phoneNumber', setRole);
          String fullName = '${user.getName} ${user.getSurname}';
          return ListTile(
            onTap: () {},
            leading: CircleAvatar(
              radius: 25.r,
              backgroundImage: const NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png'),
            ),
            title: Text(
              fullName,
              style: const TextStyle(color: Colors.black),
            ),
          );
        },
        itemCount: widget.users.length,
      );
}
