import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.userModel, required this.press});
  final UserModel userModel;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              radius: 30.r,
              backgroundColor: Colors.blueGrey,
              backgroundImage: const NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png'),
            ),
            title: Text(
              '${userModel.name} ${userModel.surname}',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(userModel.email),
            /*const Row(
              children: <Widget>[
                Icon(Icons.done_all),
                SizedBox(width: 3),
              ],
            ),*/
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                const Text(
                  '10:00',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColor.primaryColors,
                  ),
                  height: 15.h,
                  width: 15.w,
                  child: const Text(
                    '1',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
