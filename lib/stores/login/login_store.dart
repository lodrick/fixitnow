import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/screens/entryPoint/entry_point.dart';
import 'package:fixitnow/screens/home/home_screen.dart';
import 'package:fixitnow/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String uri = 'http://10.0.0.107:9090/api';
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
  bool isUserLoading = false;

  @observable
  GlobalKey<ScaffoldMessengerState> loginScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @observable
  GlobalKey<ScaffoldMessengerState> otpScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @observable
  User? firebaseUser;

  @observable
  UserModel? currentUser;

  @action
  Future<bool> isAlreadyAuthenticated() async {
    firebaseUser = _auth.currentUser!;

    return null == firebaseUser ? false : true;
  }

  @action
  Future<void> getCodeWithPhoneNumber(
      BuildContext context, String phoneNumber) async {
    final completer = Completer<String>();
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
        completer.complete('Signedup');
      },
      verificationFailed: (FirebaseAuthException e) {
        String error = e.code == 'invalid-phone-number'
            ? 'Invalid number. Enter again.'
            : 'Can Not Login Now. Please try again.';
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
        completer.complete(error);
        isloginLoading = false;
      },
      codeSent: (String verificationId, int? resendToken) {
        actualCode = verificationId;
        isloginLoading = false;
        isShowPasscode = true;
        completer.complete("verified");
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
    firebaseUser = result.user;

    if (firebaseUser!.phoneNumber!.isNotEmpty) {
      debugPrint('firebaseUser!.uid: ${firebaseUser!.uid}');
      isShowLoading = true;
      isShowConfetti = false;

      await retriveUser(firebaseUser!.uid);

      debugPrint('currentUser: $currentUser');

      if (currentUser != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => const EntryPoint(widget: HomeScreen()),
            ),
            (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (_) => RegisterScreen(
                phoneNumber: firebaseUser!.phoneNumber!,
                authId: firebaseUser!.uid,
              ),
            ),
            (route) => false);
      }
    }
    isloginLoading = false;
    isOtpLoading = false;
  }

  @action
  Future<void> registerUser({required UserModel user}) async {
    try {
      debugPrint('Request Body: ${user.toJson()}');
      final response = await http.post(Uri.parse('$uri/v1/customer'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(user));

      final json = jsonDecode(response.body)['object'] as Map<String, dynamic>;
      currentUser = UserModel.fromJson(json);
      isUserLoading = true;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> retriveUser(String authUid) async {
    try {
      final response = await http.get(Uri.parse('$uri/v1/customerss/$authUid'),
          headers: <String, String>{});
      final json = jsonDecode(response.body)['object'] as Map<String, dynamic>;
      //isUserLoading = true;
      debugPrint('currentUser: >/ ${currentUser.toString()}');
      currentUser = UserModel.fromJson(json);
      isUserLoading = true;
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    currentUser = null;
    firebaseUser = null;
    //TODO redirect to login page
  }
}
