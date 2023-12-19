import 'dart:convert';

import 'package:fixitnow/models/role/role_model.dart';
import 'package:fixitnow/models/user/user_model.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/screens/register/components/service_dialog.dart';
import 'package:fixitnow/stores/session/session_context.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:rive/rive.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    required this.authId,
    required this.phoneNumber,
  });
  final String authId;
  final String phoneNumber;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  DateTime backPressedTime = DateTime.now();
  bool isChecked = false;
  final String uri = 'http://10.0.0.107:9090/api';
  Set<RoleModel> _roles = {};

  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  //final TextEditingController _controllerAbout = TextEditingController();

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

  Widget inputTextField({
    required IconData iconData,
    required String hintText,
    required BuildContext context,
    required TextEditingController controller,
    required int maxLines,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * .008,
      ),
      child: TextFormField(
        maxLines: maxLines,
        controller: controller,
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
      child: Consumer<SessionContext>(builder: (_, sessionContext, __) {
        return Observer(
          builder: (_) => LoaderHud(
            loading: RiveAnimation.asset(
              'assets/RiveAssets/check.riv',
              fit: BoxFit.cover,
              onInit: _onCheckRiveInit,
            ),
            inAsyncCall: sessionContext.isloginLoading,
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
                    buildRegisterPane(context, sessionContext),
                  ],
                ),
              ),
              bottomNavigationBar: buildBottomSignup(
                  context: context, sessionContext: sessionContext),
            ),
          ),
        );
      }),
    );
  }

  Widget buildBottomSignup(
          {required BuildContext context,
          required SessionContext sessionContext}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: ElevatedButton.icon(
          onPressed: () async {
            debugPrint('_roles:< $_roles');
            Set<RoleModel> roleset = {};

            for (var element in _roles) {
              if (element.rid == 2) {
                roleset.add(element);
              } else if (isChecked && element.rid == 3) {
                roleset.add(element);
              }
            }
            debugPrint('authId:< ${widget.authId}');
            debugPrint('phoneNumber:< ${widget.phoneNumber}');

            UserModel userModel = UserModel.copy(
              firstName: _controllerFirstName.text.trim(),
              lastName: _controllerLastName.text.trim(),
              about: '_controllerAbout.text', //_controllerAbout.text.trim(),
              email: _controllerEmail.text.trim(),
              serviceProvider: isChecked,
              authUid: widget.authId.trim(),
              phoneNumber: widget.phoneNumber.trim(),
              photoUrl:
                  'https://cdn4.iconfinder.com/data/icons/basic-interface-overcolor/512/user-512.png',
              roles: roleset,
              createdAt: DateTime.now(),
              status: 1,
              updatedAt: DateTime.now(),
            );

            sessionContext.registerUser(context: context, user: userModel);

            /*UserController controller = UserController();

            controller.createUser(userModel).then((value) {
              setState(() {
                //responseModel = value;
                debugPrint(value!.message);
                debugPrint('${value.status}');
                debugPrint('${value.success}');
                UserModel.fromJson(value.object);
                debugPrint('${value.object}');
              });
            });*/

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

  Widget buildRegisterPane(
          BuildContext context, SessionContext sessionContext) =>
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
                context: context,
                controller: _controllerFirstName,
                maxLines: 1,
              ),
              inputTextField(
                  hintText: 'Please enter your surname',
                  iconData: Icons.people_alt_rounded,
                  context: context,
                  controller: _controllerLastName,
                  maxLines: 1),
              inputTextField(
                hintText: 'Please enter your email',
                iconData: Icons.email_outlined,
                context: context,
                controller: _controllerEmail,
                maxLines: 1,
              ),
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
                  showCustomServiceDialog(context, onValue: (_) {
                    setState(() {
                      isChecked = false;
                    });
                  });
                },
              ),
              // isChecked
              //     ? inputTextField(
              //         hintText: 'Say something about your work',
              //         iconData: Icons.email_outlined,
              //         context: context,
              //         controller: _controllerAbout,
              //         maxLines: 4,
              //       )
              //     : const SizedBox.shrink(),
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
