import 'package:fixitnow/models/user.dart';
import 'package:fixitnow/screens/chat/components/messages_widget.dart';
import 'package:fixitnow/screens/chat/components/profile_header_widget.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeerChatScreen extends StatefulWidget {
  const PeerChatScreen({super.key, required this.peerUser});
  final UserModel peerUser;

  @override
  State<PeerChatScreen> createState() => _PeerChatScreenState();
}

class _PeerChatScreenState extends State<PeerChatScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: CustomColor.primaryScaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ProfileHeaderWidget(
              name: '${widget.peerUser.getName} ${widget.peerUser.getSurname}',
              imageUrl: widget.peerUser.getPhotoUrl,
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
                  currentUser: widget.peerUser,
                  peerUser: widget.peerUser,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
