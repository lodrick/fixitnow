import 'package:fixitnow/models/user.dart';
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
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
