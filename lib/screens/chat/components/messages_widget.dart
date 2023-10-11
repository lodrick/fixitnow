import 'package:fixitnow/models/message_model.dart';
import 'package:fixitnow/models/user_model.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<MessageModel> messageCopy = [];
    for (var message in messages) {
      if (message.getIdTo == widget.peerUser.getUserId &&
          message.getIdFrom == widget.currentUser.getUserId) {
        messageCopy.add(message);
      } else if (message.getIdTo == widget.currentUser.getUserId &&
          message.getIdFrom == widget.peerUser.getUserId) {
        messageCopy.add(message);
      }
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      reverse: true,
      itemCount: messageCopy.length,
      itemBuilder: (context, index) {
        return MessageWidget(
          currentUser: widget.currentUser,
          peerUser: widget.peerUser,
          message: messageCopy[index],
          size: size,
        );
      },
    );
  }
}
