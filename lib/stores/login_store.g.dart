// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$isloginLoadingAtom =
      Atom(name: 'LoginStoreBase.isloginLoading', context: context);

  @override
  bool get isloginLoading {
    _$isloginLoadingAtom.reportRead();
    return super.isloginLoading;
  }

  @override
  set isloginLoading(bool value) {
    _$isloginLoadingAtom.reportWrite(value, super.isloginLoading, () {
      super.isloginLoading = value;
    });
  }

  late final _$isOtpLoadingAtom =
      Atom(name: 'LoginStoreBase.isOtpLoading', context: context);

  @override
  bool get isOtpLoading {
    _$isOtpLoadingAtom.reportRead();
    return super.isOtpLoading;
  }

  @override
  set isOtpLoading(bool value) {
    _$isOtpLoadingAtom.reportWrite(value, super.isOtpLoading, () {
      super.isOtpLoading = value;
    });
  }

  late final _$isShowPasscodeAtom =
      Atom(name: 'LoginStoreBase.isShowPasscode', context: context);

  @override
  bool get isShowPasscode {
    _$isShowPasscodeAtom.reportRead();
    return super.isShowPasscode;
  }

  @override
  set isShowPasscode(bool value) {
    _$isShowPasscodeAtom.reportWrite(value, super.isShowPasscode, () {
      super.isShowPasscode = value;
    });
  }

  late final _$isShowLoadingAtom =
      Atom(name: 'LoginStoreBase.isShowLoading', context: context);

  @override
  bool get isShowLoading {
    _$isShowLoadingAtom.reportRead();
    return super.isShowLoading;
  }

  @override
  set isShowLoading(bool value) {
    _$isShowLoadingAtom.reportWrite(value, super.isShowLoading, () {
      super.isShowLoading = value;
    });
  }

  late final _$isShowConfettiAtom =
      Atom(name: 'LoginStoreBase.isShowConfetti', context: context);

  @override
  bool get isShowConfetti {
    _$isShowConfettiAtom.reportRead();
    return super.isShowConfetti;
  }

  @override
  set isShowConfetti(bool value) {
    _$isShowConfettiAtom.reportWrite(value, super.isShowConfetti, () {
      super.isShowConfetti = value;
    });
  }

  late final _$loginScaffoldKeyAtom =
      Atom(name: 'LoginStoreBase.loginScaffoldKey', context: context);

  @override
  GlobalKey<ScaffoldMessengerState> get loginScaffoldKey {
    _$loginScaffoldKeyAtom.reportRead();
    return super.loginScaffoldKey;
  }

  @override
  set loginScaffoldKey(GlobalKey<ScaffoldMessengerState> value) {
    _$loginScaffoldKeyAtom.reportWrite(value, super.loginScaffoldKey, () {
      super.loginScaffoldKey = value;
    });
  }

  late final _$otpScaffoldKeyAtom =
      Atom(name: 'LoginStoreBase.otpScaffoldKey', context: context);

  @override
  GlobalKey<ScaffoldMessengerState> get otpScaffoldKey {
    _$otpScaffoldKeyAtom.reportRead();
    return super.otpScaffoldKey;
  }

  @override
  set otpScaffoldKey(GlobalKey<ScaffoldMessengerState> value) {
    _$otpScaffoldKeyAtom.reportWrite(value, super.otpScaffoldKey, () {
      super.otpScaffoldKey = value;
    });
  }

  late final _$firebaseUserAtom =
      Atom(name: 'LoginStoreBase.firebaseUser', context: context);

  @override
  User? get firebaseUser {
    _$firebaseUserAtom.reportRead();
    return super.firebaseUser;
  }

  @override
  set firebaseUser(User? value) {
    _$firebaseUserAtom.reportWrite(value, super.firebaseUser, () {
      super.firebaseUser = value;
    });
  }

  late final _$isAlreadyAuthenticatedAsyncAction =
      AsyncAction('LoginStoreBase.isAlreadyAuthenticated', context: context);

  @override
  Future<bool> isAlreadyAuthenticated() {
    return _$isAlreadyAuthenticatedAsyncAction
        .run(() => super.isAlreadyAuthenticated());
  }

  late final _$getCodeWithPhoneNumberAsyncAction =
      AsyncAction('LoginStoreBase.getCodeWithPhoneNumber', context: context);

  @override
  Future<void> getCodeWithPhoneNumber(
      BuildContext context, String phoneNumber) {
    return _$getCodeWithPhoneNumberAsyncAction
        .run(() => super.getCodeWithPhoneNumber(context, phoneNumber));
  }

  late final _$validateOtpAndLoginAsyncAction =
      AsyncAction('LoginStoreBase.validateOtpAndLogin', context: context);

  @override
  Future<void> validateOtpAndLogin(BuildContext context, String smsCode) {
    return _$validateOtpAndLoginAsyncAction
        .run(() => super.validateOtpAndLogin(context, smsCode));
  }

  late final _$signOutAsyncAction =
      AsyncAction('LoginStoreBase.signOut', context: context);

  @override
  Future<void> signOut(BuildContext context) {
    return _$signOutAsyncAction.run(() => super.signOut(context));
  }

  @override
  String toString() {
    return '''
isloginLoading: ${isloginLoading},
isOtpLoading: ${isOtpLoading},
isShowPasscode: ${isShowPasscode},
isShowLoading: ${isShowLoading},
isShowConfetti: ${isShowConfetti},
loginScaffoldKey: ${loginScaffoldKey},
otpScaffoldKey: ${otpScaffoldKey},
firebaseUser: ${firebaseUser}
    ''';
  }
}
