import 'package:fixitnow/models/rating_dto.dart';
import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/profile/components/button_widget.dart';
import 'package:fixitnow/screens/profile/components/numbers_widget.dart';
import 'package:fixitnow/screens/profile/components/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<RatingDto> ratingDtos = [
      RatingDto('4.8', 'Ranking'),
      RatingDto('35', 'Following'),
      RatingDto('50', 'Followers'),
    ];

    return Center(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 58.h),
              ProfileWidget(
                imageUrl:
                    'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
                onPress: () {},
              ),
              SizedBox(height: size.height * 0.025),
              buildName(users.first),
              SizedBox(height: size.height * 0.03),
              Center(child: buildUpgradeButton()),
              SizedBox(height: size.height * 0.03),
              NumbersWidget(ratingDto: ratingDtos),
              SizedBox(height: size.height * 0.02),
              buildAbout(users.first),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(UserModel userModel) => Column(
        children: <Widget>[
          Text(
            '${userModel.name} ${userModel.surname}',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
          ),
          const SizedBox(height: 4),
          Text(
            userModel.email,
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
              userModel.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
