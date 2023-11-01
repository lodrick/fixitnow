import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/chat/components/custom_card.dart';
import 'package:fixitnow/screens/chat/components/search_user_chat.dart';
import 'package:fixitnow/screens/chat/peer_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBodyWidget extends StatelessWidget {
  const ChatBodyWidget({
    super.key,
    required this.users,
    required this.currentUser,
    required this.size,
  });
  final List<UserModel> users;
  final UserModel currentUser;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.80,
      padding: EdgeInsets.symmetric(
        vertical: size.height.h * 0.012,
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

  Widget buildChats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SearchUserChart(
          searchText: 'Search user',
          hitSearchText: 'Search for chats and people',
          size: size,
          onPress: () {},
        ),
        SizedBox(
          height: size.height.h * 0.002,
        ),
        ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: users.length,
          itemBuilder: (context, index) {
            final peerUser = users[index];

            return CustomCard(
              userModel: peerUser,
              press: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PeerChatScreen(
                      peerUser: peerUser,
                      currentUser: currentUser,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
