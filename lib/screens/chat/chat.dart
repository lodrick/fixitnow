import 'package:fixitnow/screens/chat/components/chat_body_widget.dart';
import 'package:fixitnow/screens/chat/components/chat_header_widget.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/stores/login/login_store.dart';
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

  int userId = 2; //todo to use it as a parameter
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<LoginStore>(builder: (_, loginStore, __) {
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
                  currentUser: loginStore.currentUser!,
                  size: size,
                ),
                ChatBodyWidget(
                  loginStore: loginStore,
                  currentUser: loginStore.currentUser!,
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
