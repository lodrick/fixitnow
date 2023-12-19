import 'package:fixitnow/screens/chat/components/chat_body_widget.dart';
import 'package:fixitnow/screens/chat/components/chat_header_widget.dart';
import 'package:fixitnow/screens/chat/components/chat_round_button.dart';
import 'package:fixitnow/screens/chat/users_chat.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/stores/session/session_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;
  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<SessionContext>(builder: (_, sessionContext, __) {
      return Observer(
        builder: (_) => LoaderHud(
          inAsyncCall: false,
          loading: RiveAnimation.asset(
            'assets/RiveAssets/check.riv',
            fit: BoxFit.cover,
            onInit: _onCheckRiveInit,
          ),
          child: Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: 95.h),
                ChatHeaderWidget(
                  titleHeader: 'Chats',
                  addWidget: ChatRoundButton(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UsersChatScreen(),
                        ),
                      );
                    },
                    iconData: Icons.add,
                    size: size,
                  ),
                  landscapeWidget: ChatRoundButton(
                    press: () {},
                    iconData: Icons.stay_primary_landscape_rounded,
                    size: size,
                  ),
                  size: size,
                ),
                ChatBodyWidget(
                  currentUser: sessionContext.currentUser!,
                  isUsers: false,
                  size: size,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
