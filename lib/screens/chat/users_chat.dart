import 'package:fixitnow/screens/chat/components/chat_body_widget.dart';
import 'package:fixitnow/screens/chat/components/chat_header_widget.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/screens/notification/components/circle_button.dart';
import 'package:fixitnow/stores/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class UsersChatScreen extends StatefulWidget {
  const UsersChatScreen({super.key, required});

  @override
  State<UsersChatScreen> createState() => _UsersChatScreenState();
}

class _UsersChatScreenState extends State<UsersChatScreen> {
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
                Container(
                  padding: EdgeInsets.only(
                    top: size.width * 0.025,
                    right: size.width * 0.015,
                    left: size.width * 0.025,
                  ),
                  //height: 95.h,
                  child: Row(
                    children: <Widget>[
                      CircleButton(
                        press: () {
                          Navigator.of(context).pop();
                        },
                        size: size,
                        height: 40,
                        width: 40,
                        edgeInsets: EdgeInsets.only(
                          top: size.height * 0.00,
                          bottom: size.height * 0.000,
                        ),
                        assetsUrl: 'assets/icons/icon-back.png',
                      ),
                    ],
                  ),
                ),
                ChatHeaderWidget(
                  titleHeader: 'Users',
                  addWidget: const SizedBox.shrink(),
                  landscapeWidget: const SizedBox.shrink(),
                  size: size,
                ),
                ChatBodyWidget(
                  currentUser: loginStore.currentUser!,
                  isUsers: true,
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
