import 'package:fixitnow/models/service.dart';
import 'package:fixitnow/screens/home/components/round_button.dart';
import 'package:fixitnow/screens/home/components/service_widget.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/stores/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  //final UserModel userModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 60.0.h,
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * .02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isDisplaySearch == true
                                ? Container(
                                    width: size.width * .87,
                                    margin: EdgeInsets.only(
                                      top: size.height * 0.02,
                                      bottom: size.height * 0.006,
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
                                          fontSize: 18.0.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        prefixIcon: GestureDetector(
                                          child: const Icon(Icons.arrow_back),
                                          onTap: () {
                                            setState(() {
                                              isDisplaySearch =
                                                  !isDisplaySearch;
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
                                  )
                                : const SizedBox.shrink(),
                            isDisplaySearch == false
                                ? RoundButton(
                                    size: size,
                                    press: () {
                                      setState(() {
                                        isDisplaySearch = !isDisplaySearch;
                                      });
                                      debugPrint(
                                          'Home Screen: ${loginStore.currentUser!.firstName} ${loginStore.currentUser!.authUid}');
                                    },
                                    riveAssetsUrl: 'assets/icons/search.svg',
                                  )
                                : const SizedBox.shrink()
                          ],
                        )),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      height: MediaQuery.of(context).size.height * 0.825,
                      width: MediaQuery.of(context).size.width,
                      child: ServiceWidget(
                        services: serviceModel,
                        size: MediaQuery.of(context).size,
                        userModel: loginStore.currentUser!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
