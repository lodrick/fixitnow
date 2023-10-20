import 'package:fixitnow/models/rating_dto.dart';
import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/notification/components/circle_button.dart';
import 'package:fixitnow/screens/profile/components/button_widget.dart';
import 'package:fixitnow/screens/profile/components/numbers_widget.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    List<RatingDto> ratingDtos = [
      RatingDto('4.8', 'Ranking'),
      RatingDto('35', 'Following'),
      RatingDto('50', 'Followers'),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: size.height * 0.3,
            floating: true,
            pinned: true,
            backgroundColor: CustomColor.primaryScaffoldBackgroundColor,
            flexibleSpace: Container(
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
                      vertical: size.height * 0.015.h,
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
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.02.w,
                      ),
                      child: Row(
                        children: <Widget>[
                          CircleButton(
                            press: () {
                              Navigator.of(context).pop();
                            },
                            size: size,
                            height: 38.5,
                            width: 38.5,
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
          buildNotificationContent(ratingDtos),
        ],
      ),
    );
  }

  Widget buildNotificationContent(List<RatingDto> ratingDtos) =>
      SliverToBoxAdapter(
        child: SizedBox(
          height: size.height * 0.6.h,
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.02.h),
              buildName(users.first),
              SizedBox(height: size.height * 0.02.h),
              Center(child: buildUpgradeButton()),
              SizedBox(height: size.height * 0.02.h),
              NumbersWidget(ratingDto: ratingDtos),
              SizedBox(height: size.height * 0.02.h),
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
