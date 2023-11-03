import 'package:fixitnow/api/user_api.dart';
import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/chat/components/custom_card.dart';
import 'package:fixitnow/screens/chat/components/search_user_chat.dart';
import 'package:fixitnow/screens/chat/peer_chat.dart';
import 'package:fixitnow/stores/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBodyWidget extends StatelessWidget {
  const ChatBodyWidget({
    super.key,
    required this.loginStore,
    required this.currentUser,
    required this.size,
  });
  final LoginStore loginStore;
  final UserModel currentUser;
  final Size size;

  @override
  Widget build(BuildContext context) {
    loginStore.retrieveUsers();
    return Expanded(
      child: Container(
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
        child: buildChats(context: context),
      ),
    );
  }

  Widget buildChats({required BuildContext context}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SearchUserChart(
            searchText: 'Search user',
            hitSearchText: 'Search for chats and people',
            size: size,
            onPress: () {},
          ),
          StreamBuilder(
              stream: UserApi.retrieveUsers(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      debugPrint('${snapshot.error}');
                      return buildText('Something Went Wrong Try again later.');
                    } else {
                      var users = snapshot.data;
                      if (users!.isEmpty) {
                        return buildText('No users found');
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: loginStore.users!.length,
                        itemBuilder: (context, index) {
                          final peerUser = loginStore.users![index];
                          return peerUser.uid != currentUser.uid
                              ? CustomCard(
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
                                )
                              : const SizedBox.shrink();
                        },
                      );
                    }
                }
              })
        ],
      ),
    );
  }

  Widget buildText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.grey,
      ),
    );
  }
}
