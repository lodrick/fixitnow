import 'package:fixitnow/models/rating_dto.dart';
import 'package:fixitnow/models/user/user_model.dart';
import 'package:fixitnow/screens/common/components/camera_widget.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/screens/profile/components/button_widget.dart';
import 'package:fixitnow/screens/profile/components/numbers_widget.dart';
import 'package:fixitnow/screens/profile/components/profile_widget.dart';
import 'package:fixitnow/stores/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

    List<RatingDto> ratingDtos = [
      RatingDto('4.8', 'Ranking'),
      RatingDto('35', 'Following'),
      RatingDto('50', 'Followers'),
    ];

    return Consumer<LoginStore>(builder: (_, loginStore, __) {
      return Observer(
        builder: (_) => LoaderHud(
            inAsyncCall: false,
            loading: RiveAnimation.asset(
              'assets/RiveAssets/check.riv',
              fit: BoxFit.cover,
              onInit: _onCheckRiveInit,
            ),
            child: Center(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: size.width * 0.25.h),
                      ProfileWidget(
                        imageUrl:
                            'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
                        onPress: () {
                          debugPrint('detcher');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CameraWidget(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: size.height * 0.025),
                      buildName(loginStore.currentUser!),
                      SizedBox(height: size.height * 0.03),
                      Center(child: buildUpgradeButton()),
                      SizedBox(height: size.height * 0.03),
                      NumbersWidget(ratingDto: ratingDtos),
                      SizedBox(height: size.height * 0.02),
                      buildAbout(loginStore.currentUser!),
                    ],
                  ),
                ),
              ),
            )),
      );
    });
  }

  Widget buildName(UserModel userModel) => Column(
        children: <Widget>[
          Text(
            '${userModel.firstName} ${userModel.lastName}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
          ),
          const SizedBox(height: 4),
          Text(
            userModel.email!,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      );

  buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onPress: () {},
      );

  Widget buildAbout(UserModel userModel) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              userModel.about!,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
