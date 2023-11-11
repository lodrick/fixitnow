import 'package:fixitnow/models/rating_dto.dart';
import 'package:fixitnow/models/user/user_model.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/screens/notification/components/circle_button.dart';
import 'package:fixitnow/screens/profile/components/button_widget.dart';
import 'package:fixitnow/screens/profile/components/numbers_widget.dart';
import 'package:fixitnow/stores/login/login_store.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.size});
  final Size size;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: widget.size.height * 0.3,
                  floating: true,
                  pinned: true,
                  backgroundColor: const Color.fromRGBO(238, 241, 248, 1),
                  flexibleSpace: Container(
                    padding: EdgeInsets.only(top: widget.size.width * 0.095.h),
                    decoration: BoxDecoration(
                      color: CustomColor.primaryColors.withOpacity(0.2),
                      image: DecorationImage(
                        image: const NetworkImage(
                          'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
                        ),
                        colorFilter: ColorFilter.mode(
                          CustomColor.primaryColors.withOpacity(1),
                          BlendMode.darken,
                        ),
                        fit: BoxFit.fill,
                      ),
                      backgroundBlendMode: BlendMode.multiply,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: widget.size.height * 0.015.h,
                          ),
                          child: CircleAvatar(
                            radius: 100.r,
                            backgroundColor:
                                CustomColor.primaryColors.withOpacity(0.8),
                            backgroundImage: const NetworkImage(
                              'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
                            ),
                          ),
                        ),
                        Positioned(
                          top: -40,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: widget.size.width * 0.02.w,
                            ),
                            child: Row(
                              children: <Widget>[
                                CircleButton(
                                  press: () {
                                    Navigator.of(context).pop();
                                  },
                                  size: widget.size,
                                  height: 38.5,
                                  width: 38.5,
                                  edgeInsets: EdgeInsets.only(
                                    top: widget.size.height * 0.02,
                                    bottom: widget.size.height * 0.006,
                                  ),
                                  assetsUrl: 'assets/icons/icon-back.png',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  automaticallyImplyLeading: false,
                ),
                buildNotificationContent(
                    ratingDtos: ratingDtos,
                    currentUser: loginStore.currentUser!),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildNotificationContent(
          {required List<RatingDto> ratingDtos,
          required UserModel currentUser}) =>
      SliverToBoxAdapter(
        child: SizedBox(
          height: widget.size.height * 0.6.h,
          child: Column(
            children: <Widget>[
              SizedBox(height: widget.size.height * 0.02.h),
              buildName(currentUser),
              SizedBox(height: widget.size.height * 0.02.h),
              Center(child: buildUpgradeButton()),
              SizedBox(height: widget.size.height * 0.02.h),
              NumbersWidget(ratingDto: ratingDtos),
              SizedBox(height: widget.size.height * 0.02.h),
              buildDescription(),
            ],
          ),
        ),
      );

  buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onPress: () {},
      );

  Widget buildName(UserModel userModel) => Column(
        children: <Widget>[
          Text(
            'Cleaner',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
          ),
          const SizedBox(height: 2),
          const Text(
            'Title',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );

  Widget buildDescription() => Container(
        padding: EdgeInsets.symmetric(horizontal: 48.w),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
              style: TextStyle(fontSize: 16, height: 1.4),
              softWrap: true,
              maxLines: 7,
            ),
          ],
        ),
      );
}
