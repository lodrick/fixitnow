import 'package:fixitnow/models/service/service_model.dart';
import 'package:fixitnow/screens/home/components/products_widget.dart';
import 'package:fixitnow/screens/home/components/round_button.dart';
import 'package:fixitnow/screens/home/components/service_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //final UserModel userModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, IconData> _productMap = {
    'Plumbing': FontAwesomeIcons.piedPiperAlt,
    'House Chao': FontAwesomeIcons.houseChimneyCrack,
    'Gardening': FontAwesomeIcons.screwdriverWrench,
    'Landscaping': FontAwesomeIcons.shapes,
    'Property Painting': FontAwesomeIcons.paintbrush,
    'Appliance Repairer': FontAwesomeIcons.screwdriverWrench,
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isDisplaySearch = false;

  @override
  Widget build(BuildContext context) {
    List<ServiceModel> serviceModel = [];

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 105.0.h,
            padding: EdgeInsets.symmetric(horizontal: size.width * .02),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                SizedBox(width: size.width * 0.113),
                isDisplaySearch == true
                    ? Expanded(
                        child: Container(
                          //width: size.width * .87,
                          height: size.width * 0.090.h,
                          margin: EdgeInsets.only(
                            top: size.height * 0.02,
                            bottom: size.height * 0.009,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: const Offset(0, 3),
                                blurRadius: 20.r,
                              ),
                            ],
                          ),
                          child: TextField(
                            onChanged: (value) {
                              debugPrint(value);
                            },
                            style: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.6.sp),
                              fontSize: 18.0.sp,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.r),
                                ),
                              ),
                              hintText: 'Search',
                              hintStyle: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: GestureDetector(
                                child: const Icon(Icons.arrow_back),
                                onTap: () {
                                  setState(() {
                                    isDisplaySearch = !isDisplaySearch;
                                  });
                                },
                              ),
                              suffixIcon: GestureDetector(
                                child: const Icon(Icons.search),
                                onTap: () {
                                  debugPrint('Search');
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                isDisplaySearch == false
                    ? RoundButton(
                        press: () {
                          setState(() {
                            isDisplaySearch = !isDisplaySearch;
                          });
                        },
                        size: size,
                        riveAssetsUrl: 'assets/icons/search.svg',
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  ProductsScreen(productMap: _productMap, size: size),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ServiceWidget(
                        services: serviceModel,
                        size: MediaQuery.of(context).size,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
