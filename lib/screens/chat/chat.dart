import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/chat/components/chat_body_widget.dart';
import 'package:fixitnow/screens/chat/components/chat_header_widget.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //List<UserModel> users = users;
  int userId = 2; //todo to use it as a parameter
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: size.height.h * 0.087,
              floating: true,
              pinned: true,
              backgroundColor: CustomColor.primaryScaffoldBackgroundColor,
            ),
            buildChatPane(context, size),
          ],
        ),
      ),
    );
  }

  Widget buildChatPane(BuildContext context, Size size) => SliverToBoxAdapter(
        child: Column(
          children: <Widget>[
            ChatHeaderWidget(
              currentUserId: userId,
              size: size,
            ),
            ChatBodyWidget(
              users: users,
              currentUserId: userId,
              size: size,
            ),
          ],
        ),
      );
}
