import 'package:fixitnow/models/user/user_model.dart';
import 'package:fixitnow/screens/chat/components/messages_widget.dart';
import 'package:fixitnow/screens/chat/components/new_message_widget.dart';
import 'package:fixitnow/screens/chat/components/profile_header_widget.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeerChatScreen extends StatefulWidget {
  const PeerChatScreen({
    super.key,
    required this.peerUser,
    required this.currentUser,
  });
  final UserModel peerUser;
  final UserModel currentUser;

  @override
  State<PeerChatScreen> createState() => _PeerChatScreenState();
}

class _PeerChatScreenState extends State<PeerChatScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomColor.primaryColors,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProfileHeaderWidget(
              name: '${widget.peerUser.firstName} ${widget.peerUser.lastName}',
              imageUrl: widget.peerUser.photoUrl,
              size: size,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width.w * 0.03,
                  vertical: size.height.h * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                child: MessagesWidget(
                  currentUser: widget.currentUser,
                  peerUser: widget.peerUser,
                ),
              ),
            ),
            NewMessageWidget(
              currentUser: widget.currentUser,
              peerUser: widget.peerUser,
            ),
          ],
        ),
      ),
    );
  }
}
