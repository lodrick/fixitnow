import 'package:fixitnow/screens/notification/components/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List todayItem = [
      "follow",
      "liked",
      "liked",
      "liked",
      "liked",
      "liked",
      "liked",
      "liked",
      "liked",
      "liked",
      "liked"
    ];
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 55.h,
            ),
            SizedBox(
              height: 40.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Notifications',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              padding: const EdgeInsets.only(bottom: 65),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
              ),
              height: size.height * 0.9,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: todayItem.length,
                addSemanticIndexes: true,
                itemBuilder: (context, index) {
                  return NotificationWidget(size: size);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
