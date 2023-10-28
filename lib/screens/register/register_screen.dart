import 'dart:convert';

import 'package:fixitnow/models/role_model.dart';
import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/entryPoint/entry_point.dart';
import 'package:fixitnow/screens/home/home_screen.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/stores/login/login_store.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime backPressedTime = DateTime.now();
  bool isChecked = false;
  final String uri = 'http://10.0.0.107:9090/api';
  Set<RoleModel> _roles = {};

  Future<Set<RoleModel>> retrieveRoles() async {
    Set<RoleModel> roles = {};
    try {
      final response = await http
          .get(Uri.parse('$uri/v1/roles'), headers: <String, String>{});

      Iterable iterable = jsonDecode(response.body)['object'] as Iterable;
      roles = Set<RoleModel>.from(
        iterable.map(
          (model) => RoleModel.fromJson(model),
        ),
      );
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return roles;
  }

  @override
  void initState() {
    super.initState();
    retrieveRoles().then((value) {
      setState(() {
        _roles = value;
      });
    });
  }

  Widget inputTextField(
      {required IconData iconData,
      required String hintText,
      required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * .008,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          focusColor: Colors.white,
          prefixIcon: Icon(
            iconData,
            color: Colors.grey,
          ),
          //errorText: "Error",
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.white,
          hoverColor: Colors.white70,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: "verdana_regular",
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () => _onBackButtonBoubleClicked(context),
      child: Consumer<LoginStore>(builder: (_, userStore, __) {
        return Observer(
          builder: (_) => LoaderHud(
            inAsyncCall: userStore.isRegisterLoading,
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 243, 243, 243),
              extendBody: true,
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: screenHeight * .25,
                      //backgroundColor: const Color.fromARGB(255, 243, 243, 243),
                      floating: true,
                      pinned: true,
                      leading: Container(
                        alignment: Alignment.center,
                        height: screenHeight * .25,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(),
                        collapseMode: CollapseMode.pin,
                      ),
                    ),
                    buildRegisterPane(context, userStore),
                  ],
                ),
              ),
              bottomNavigationBar:
                  buildBottomSignup(context: context, userStore: userStore),
            ),
          ),
        );
      }),
    );
  }

  Widget buildBottomSignup(
          {required BuildContext context, required LoginStore userStore}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: ElevatedButton.icon(
          onPressed: () {
            debugPrint('_roles:< $_roles');
            Set<RoleModel> roleset = {};

            for (var element in _roles) {
              if (element.rid == 2) {
                roleset.add(element);
              } else if (isChecked && element.rid == 3) {
                roleset.add(element);
              }
            }
            debugPrint('roleset:< $roleset');

            /*UserModel userModel = UserModel.copy(
                      '_authId',
                      '_name',
                      '_surname',
                      '_about',
                      '_email',
                      '_photoUrl',
                      '_phoneNumber',
                      setRole,
                    );*/
            Future.delayed(const Duration(seconds: 1), () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EntryPoint(widget: HomeScreen()),
                ),
              );
            });
            //userStore.registerUser(userModel: userModel);
            roleset = {};
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColor.primaryColors,
            minimumSize: const Size(double.infinity, 56),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(30.r),
                bottomLeft: Radius.circular(30.r),
                bottomRight: Radius.circular(30.r),
              ),
            ),
          ),
          icon: const Icon(
            CupertinoIcons.arrow_right,
            color: Colors.white,
          ),
          label: const Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget buildRegisterPane(BuildContext context, LoginStore userStore) =>
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .03,
            horizontal: MediaQuery.of(context).size.width * .04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputTextField(
                  hintText: 'Please enter your name',
                  iconData: Icons.person_2_rounded,
                  context: context),
              inputTextField(
                  hintText: 'Please enter your surname',
                  iconData: Icons.people_alt_rounded,
                  context: context),
              inputTextField(
                  hintText: 'Please enter your email',
                  iconData: Icons.email_outlined,
                  context: context),
              CheckboxListTile(
                visualDensity: VisualDensity.compact,
                title: const Text(
                  'I want to be a service provider',
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: const Text(
                  'Please check this box',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "verdana_regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                checkColor: Colors.white,
                shape: const CircleBorder(),
                value: isChecked,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ],
          ),
        ),
      );

  void toast(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      backgroundColor: CustomColor.primaryColors.withOpacity(0.70),
    ));
  }

  Future<bool> _onBackButtonBoubleClicked(BuildContext context) async {
    return false;
  }
}
/*
Column(
          children: [
            const Text(
              "Sign in",
              style: TextStyle(
                fontSize: 34,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 45, 61, 46),
              ),
            ),
            const Text(
              "Create your new account, we are glad that you joined us.",
              overflow: TextOverflow.visible,
              maxLines: 5,
              softWrap: true,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            inputTextField(
                hintText: 'Please enter your name',
                iconData: Icons.person_2_outlined),
            inputTextField(
                hintText: 'Please enter your surname',
                iconData: Icons.person_2_outlined),
            inputTextField(
                hintText: 'please enter your email',
                iconData: Icons.person_2_outlined),
            inputTextField(
                hintText: 'Please enter your status',
                iconData: Icons.person_2_outlined),
          ],
        ),
*/