// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_context.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SessionContext on SessionContextBase, Store {
  late final _$isloginLoadingAtom =
      Atom(name: 'SessionContextBase.isloginLoading', context: context);

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
      Atom(name: 'SessionContextBase.isOtpLoading', context: context);

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
      Atom(name: 'SessionContextBase.isShowPasscode', context: context);

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
      Atom(name: 'SessionContextBase.isShowLoading', context: context);

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
      Atom(name: 'SessionContextBase.isShowConfetti', context: context);

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

  late final _$isUserCreatedAtom =
      Atom(name: 'SessionContextBase.isUserCreated', context: context);

  @override
  bool get isUserCreated {
    _$isUserCreatedAtom.reportRead();
    return super.isUserCreated;
  }

  @override
  set isUserCreated(bool value) {
    _$isUserCreatedAtom.reportWrite(value, super.isUserCreated, () {
      super.isUserCreated = value;
    });
  }

  late final _$serviceModelAtom =
      Atom(name: 'SessionContextBase.serviceModel', context: context);

  @override
  ServiceModel? get serviceModel {
    _$serviceModelAtom.reportRead();
    return super.serviceModel;
  }

  @override
  set serviceModel(ServiceModel? value) {
    _$serviceModelAtom.reportWrite(value, super.serviceModel, () {
      super.serviceModel = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: 'SessionContextBase.currentUser', context: context);

  @override
  UserModel? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$usersAtom =
      Atom(name: 'SessionContextBase.users', context: context);

  @override
  List<UserModel>? get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserModel>? value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$responseModelAtom =
      Atom(name: 'SessionContextBase.responseModel', context: context);

  @override
  ResponseModel? get responseModel {
    _$responseModelAtom.reportRead();
    return super.responseModel;
  }

  @override
  set responseModel(ResponseModel? value) {
    _$responseModelAtom.reportWrite(value, super.responseModel, () {
      super.responseModel = value;
    });
  }

  late final _$loginScaffoldKeyAtom =
      Atom(name: 'SessionContextBase.loginScaffoldKey', context: context);

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
      Atom(name: 'SessionContextBase.otpScaffoldKey', context: context);

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
      Atom(name: 'SessionContextBase.firebaseUser', context: context);

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

  late final _$currentPositionAtom =
      Atom(name: 'SessionContextBase.currentPosition', context: context);

  @override
  Position? get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position? value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  late final _$isAlreadyAuthenticatedAsyncAction = AsyncAction(
      'SessionContextBase.isAlreadyAuthenticated',
      context: context);

  @override
  Future<bool> isAlreadyAuthenticated() {
    return _$isAlreadyAuthenticatedAsyncAction
        .run(() => super.isAlreadyAuthenticated());
  }

  late final _$getCodeWithPhoneNumberAsyncAction = AsyncAction(
      'SessionContextBase.getCodeWithPhoneNumber',
      context: context);

  @override
  Future<void> getCodeWithPhoneNumber(
      BuildContext context, String phoneNumber) {
    return _$getCodeWithPhoneNumberAsyncAction
        .run(() => super.getCodeWithPhoneNumber(context, phoneNumber));
  }

  late final _$validateOtpAndLoginAsyncAction =
      AsyncAction('SessionContextBase.validateOtpAndLogin', context: context);

  @override
  Future<void> validateOtpAndLogin(BuildContext context, String smsCode) {
    return _$validateOtpAndLoginAsyncAction
        .run(() => super.validateOtpAndLogin(context, smsCode));
  }

  late final _$registerUserAsyncAction =
      AsyncAction('SessionContextBase.registerUser', context: context);

  @override
  Future<void> registerUser(
      {required BuildContext context, required UserModel user}) {
    return _$registerUserAsyncAction
        .run(() => super.registerUser(context: context, user: user));
  }

  late final _$retriveUserAsyncAction =
      AsyncAction('SessionContextBase.retriveUser', context: context);

  @override
  Future<void> retriveUser(
      {required BuildContext context, required String authUid}) {
    return _$retriveUserAsyncAction
        .run(() => super.retriveUser(context: context, authUid: authUid));
  }

  late final _$retrieveUsersAsyncAction =
      AsyncAction('SessionContextBase.retrieveUsers', context: context);

  @override
  Future<List<UserModel>> retrieveUsers() {
    return _$retrieveUsersAsyncAction.run(() => super.retrieveUsers());
  }

  late final _$signOutAsyncAction =
      AsyncAction('SessionContextBase.signOut', context: context);

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
isUserCreated: ${isUserCreated},
serviceModel: ${serviceModel},
currentUser: ${currentUser},
users: ${users},
responseModel: ${responseModel},
loginScaffoldKey: ${loginScaffoldKey},
otpScaffoldKey: ${otpScaffoldKey},
firebaseUser: ${firebaseUser},
currentPosition: ${currentPosition}
    ''';
  }
}
