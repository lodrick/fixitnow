import 'package:fixitnow/main.dart';
import 'package:fixitnow/models/service/service_model.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceWidget extends StatelessWidget {
  final List<ServiceModel> services;
  final Size size;
  const ServiceWidget({
    super.key,
    required this.services,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return buildService();
  }

  Widget buildService() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(parent: BouncingScrollPhysics()),
      reverse: false,
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .01.w,
              vertical: size.height * .000.h,
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Material(
                  color: const Color(0xFFEEF1F8),
                  borderRadius: BorderRadius.circular(20.r),
                  elevation: 3.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * .01.w,
                      vertical: size.height * .014.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: size.width * 0.42.w,
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
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        overflow: TextOverflow.fade,
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
                              Text(
                                'Cleaner of the and all year till time time tine time',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                softWrap: true,
                              ),
                              SizedBox(
                                height: size.height * .005,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '2023 Sep 11',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: true,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          FontAwesomeIcons.locationDot,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0.sp,
                                        ),
                                      ),
                                      Text(
                                        ' 0km',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        softWrap: true,
                                      ),
                                    ],
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
                        height: (180.0 / mockUpHeight * size.height),
                        width: size.width * 0.4.w,
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
      },
    );
  }
}
