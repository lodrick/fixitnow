import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String actualCode = '';
  @observable
  bool isloginLoading = false;
  @observable
  bool isOtpLoading = false;
  @observable
  bool isShowPasscode = false;

  @observable
  GlobalKey<ScaffoldMessengerState> loginScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @observable
  GlobalKey<ScaffoldMessengerState> otpScaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @observable
  User? firebaseUser;

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
        completer.complete('timeout');
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
      firebaseUser!.uid;
      //TODO to add main page
    } else {
      //TODO to add the profile add pages
    }
    isloginLoading = false;
    isOtpLoading = false;
  }

  @action
  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    //TODO redirect to login page

    firebaseUser = null;
  }
}
