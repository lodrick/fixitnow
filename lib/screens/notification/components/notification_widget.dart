import 'package:fixitnow/screens/notification/notfication.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.size});
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationScreen(size: size),
              ),
            );
          },
          leading: CircleAvatar(
            radius: 25.r,
            backgroundColor: CustomColor.primaryColors,
            backgroundImage: const NetworkImage(
                'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png'),
          ),
          title: Text(
            'Dean Winchester',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            'New following you  .  h1"',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          trailing: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '10:00',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'unread',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
