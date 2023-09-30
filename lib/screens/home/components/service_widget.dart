import 'package:fixitnow/main.dart';
import 'package:fixitnow/models/service.dart';
import 'package:fixitnow/models/user.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceWidget extends StatelessWidget {
  final List<ServiceModel> services;
  final UserModel userModel;
  final Size size;
  const ServiceWidget({
    super.key,
    required this.services,
    required this.userModel,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return buildService();
  }

  Widget buildService() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
        reverse: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * .01,
                vertical: size.height * .005,
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.circular(20.r),
                    elevation: 4.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * .01,
                        vertical: size.height * .014,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(
                            width: size.width * .42,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Hero(
                                        tag: 'tag $index',
                                        child: Text(
                                          'Cleaner',
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          overflow: TextOverflow.fade,
                                          //textScaleFactor: textScaleFactor,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        FontAwesomeIcons.star,
                                        color: Colors.grey,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  'Cleaner of the and all year till time time tine time',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: true,
                                  //textScaleFactor: textScaleFactor,
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Text(
                                  '2023 Sep 11',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: true,
                                  //textScaleFactor: textScaleFactor,
                                ),
                                SizedBox(
                                  height: size.height * .005,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        FontAwesomeIcons.locationDot,
                                        color: Theme.of(context).primaryColor,
                                        size: 16.0.sp,
                                      ),
                                    ),
                                    Text(
                                      'Distance: 0km',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      softWrap: true,
                                      //textScaleFactor: textScaleFactor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        height: 185.0 / mockUpHeight * size.height,
                        width: size.width * 0.4,
                      ),
                      Hero(
                        tag: 'title $index',
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          height: (190.0 / mockUpHeight * size.height),
                          width: size.width * 0.4,
                          decoration: const BoxDecoration(
                            color: CustomColor.primaryColors,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            /*image: DecorationImage(
                                image: NetworkImage(
                                    './assets/Backgrounds/Spline.png'),
                                fit: BoxFit.cover,
                              ),*/
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
