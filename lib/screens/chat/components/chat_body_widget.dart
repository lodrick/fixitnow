import 'package:fixitnow/models/role_model.dart';
import 'package:fixitnow/models/user.dart';
import 'package:fixitnow/screens/chat/components/custom_card.dart';
import 'package:fixitnow/screens/chat/components/search_user_chat.dart';
import 'package:fixitnow/screens/chat/peer_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBodyWidget extends StatelessWidget {
  final List<UserModel> users;
  //final UserModel currentUser = ;
  final int currentUserId;
  final Size size;
  const ChatBodyWidget({
    super.key,
    required this.users,
    required this.currentUserId,
    required this.size,
  });

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
    Set<RoleModel> setRole = {};
    UserModel currentUser = UserModel(
        1,
        '_name',
        '_surname',
        '_about',
        '_email',
        'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
        '_phoneNumber',
        setRole);

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
          itemCount: 2,
          itemBuilder: (context, index) {
            Set<RoleModel> setRole = {};
            final peerUser = users.isNotEmpty
                ? users[index]
                : UserModel(
                    1,
                    '_name',
                    '_surname',
                    '_about',
                    '_email',
                    'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
                    '_phoneNumber',
                    setRole);
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
