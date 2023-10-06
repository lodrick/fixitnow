import 'package:fixitnow/models/message_model.dart';
import 'package:fixitnow/models/user.dart';
import 'package:fixitnow/screens/chat/components/message_widget.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatefulWidget {
  const MessagesWidget({
    super.key,
    required this.peerUser,
    required this.currentUser,
  });
  final UserModel peerUser;
  final UserModel currentUser;

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  List<MessageModel> messages = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageWidget(
          currentUser: widget.currentUser,
          peerUser: widget.peerUser,
          message: messages[index],
          size: size,
        );
      },
    );
  }
}
