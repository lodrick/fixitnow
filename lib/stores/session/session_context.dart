import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixitnow/api/user_api.dart';
import 'package:fixitnow/models/response.dart';
import 'package:fixitnow/models/service/service_model.dart';
import 'package:fixitnow/models/user/user_model.dart';
import 'package:fixitnow/screens/entryPoint/entry_point.dart';
import 'package:fixitnow/screens/home/home_screen.dart';
import 'package:fixitnow/screens/onboarding/onboarding_screen.dart';
import 'package:fixitnow/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'session_context.g.dart';

class SessionContext = SessionContextBase with _$SessionContext;

abstract class SessionContextBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String uri = UserApi.userUri;
  String actualCode = '';
  @observable
  bool isloginLoading = false;
  @observable
  bool isOtpLoading = false;
  @observable
  bool isShowPasscode = false;
  @observable
  bool isShowLoading = false;
  @observable
  bool isShowConfetti = false;
  @observable
  bool isUserCreated = false;
  @observable
  ServiceModel? serviceModel;
  @observable
  UserModel? currentUser;
  @observable
  List<UserModel>? users;
  @observable
  ResponseModel? responseModel;

  @observable
  GlobalKey<ScaffoldMessengerState> loginScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @observable
  GlobalKey<ScaffoldMessengerState> otpScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @observable
  User? firebaseUser;

  @observable
  Position? currentPosition;

  @action
  Future<bool> isAlreadyAuthenticated() async {
    firebaseUser = _auth.currentUser!;

    return true;
  }

  @action
  Future<void> getCodeWithPhoneNumber(
      BuildContext context, String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        UserCredential credential = await _auth
            .signInWithCredential(phoneAuthCredential)
            .then((UserCredential userCredential) {
          if (userCredential.user != null) {
            debugPrint('getCodeWithPhoneNumber: Authentication successful');

            onAuthenticationSuccessful(
              context: context,
              result: userCredential,
            );
          } else {
            var snackBar = const SnackBar(
              content: Text('Invalid code/invalid authentication'),
            );
            loginScaffoldKey.currentState!.showSnackBar(snackBar);
          }
          return userCredential;
        }).catchError((onError) {
          var snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.deepOrange[400],
            content: const Text(
              'Something has gone wrong, please try later.',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          );

          loginScaffoldKey.currentState!.showSnackBar(snackBar);
          return onError;
        });
        firebaseUser = credential.user!;
      },
      verificationFailed: (FirebaseAuthException e) {
        /*String error = e.code == 'invalid-phone-number'
            ? 'Invalid number. Enter again.'
            : 'Can Not Login Now. Please try again.';*/
        var snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.deepOrange[400],
          content: const Text(
            'The phone number format is incorrect. Please enter your number in E.164 format. [+][country code][number]',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );
        loginScaffoldKey.currentState!.showSnackBar(snackBar);
        isloginLoading = false;
      },
      codeSent: (String verificationId, int? resendToken) {
        actualCode = verificationId;
        isloginLoading = false;
        isShowPasscode = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        actualCode = verificationId;
        //completer.complete('timeout');
      },
    );
  }

  @action
  Future<void> validateOtpAndLogin(BuildContext context, String smsCode) async {
    isOtpLoading = true;
    final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: actualCode, smsCode: smsCode);

    await _auth.signInWithCredential(authCredential).catchError((onError) {
      isOtpLoading = false;
      debugPrint('Authentication faield: $onError');
      var snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.deepOrange[400],
        content: const Text(
          'Wrong code ! Please enter the last code received.',
          style: TextStyle(color: Colors.white),
        ),
      );
      otpScaffoldKey.currentState!.showSnackBar(snackBar);
      return onError;
    }).then((UserCredential credential) {
      if (credential.user != null) {
        debugPrint('validateOtpAndLogin: Authentication successful');
        onAuthenticationSuccessful(context: context, result: credential);
      }
    });
  }

  Future<void> onAuthenticationSuccessful(
      {required BuildContext context, required UserCredential result}) async {
    isloginLoading = true;
    isOtpLoading = true;
    firebaseUser = result.user!;

    if (firebaseUser!.phoneNumber!.isNotEmpty && firebaseUser!.uid.isNotEmpty) {
      debugPrint('firebaseUser!.uid: ${firebaseUser!.uid}');
      isShowLoading = true;
      isShowConfetti = true;

      retriveUser(context: context, authUid: firebaseUser!.uid);
    }
    isloginLoading = false;
    isOtpLoading = false;
  }

  @action
  Future<void> registerUser(
      {required BuildContext context, required UserModel user}) async {
    try {
      final response = await http.post(Uri.parse('$uri/v1/customer'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user));

      final json = jsonDecode(response.body)['object'] as Map<String, dynamic>;
      debugPrint('registerUser json $json');
      currentUser = UserModel.fromJson(json);
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EntryPoint(widget: HomeScreen()),
          ),
        );
        isUserCreated = true;
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @action
  Future<void> retriveUser(
      {required BuildContext context, required String authUid}) async {
    try {
      final response = await http.get(Uri.parse('$uri/v1/customerss/$authUid'),
          headers: <String, String>{});
      Map<String, dynamic> json = {};

      debugPrint('response.body ${response.body}');
      if (response.body.isNotEmpty &&
          jsonDecode(response.body)['status'] == 200) {
        json = jsonDecode(response.body)['object'] as Map<String, dynamic>;
        currentUser = UserModel.fromJson(json);
        debugPrint('retriveUser json $json');
        isUserCreated = true;
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EntryPoint(widget: HomeScreen()),
            ),
          );
          isUserCreated = true;
        });
      } else if (response.body.isNotEmpty &&
          jsonDecode(response.body)['status'] == 404) {
        currentUser = null;
        isUserCreated = false;

        Future.delayed(const Duration(seconds: 1), () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => RegisterScreen(
                  phoneNumber: firebaseUser!.phoneNumber!,
                  authId: firebaseUser!.uid,
                ),
              ),
              (route) => false);
        });
      }
    } on Exception catch (e) {
      debugPrint('$e');
    }
  }

  @action
  Future<List<UserModel>> retrieveUsers() async {
    try {
      final response = await http
          .get(Uri.parse('$uri/v1/customers'), headers: <String, String>{});
      Iterable json = {};

      if (response.body.isNotEmpty &&
          jsonDecode(response.body)['status'] == 200) {
        json = jsonDecode(response.body)['object'] as Iterable;
        Iterable iterable = json;

        users = List<UserModel>.from(
          iterable.map((model) => UserModel.fromJson(model)),
        );
      }

      debugPrint('Users: $users');
    } on Exception catch (e) {
      debugPrint('$e');
    }
    return users!;
  }

  /*@action
  void getCurrentLocation() async {
    currentPosition = await GeoLocatorService.getLocation();
  }*/

  @action
  Future<void> signOut(BuildContext context) async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
          (route) => false);
    });

    await _auth.signOut();
    currentUser = null;
    firebaseUser = null;
  }
}
