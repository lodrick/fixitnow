import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/screens/register/register_screen.dart';
import 'package:fixitnow/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  late PhoneNumber _number = PhoneNumber(isoCode: 'ZA');
  final TextEditingController phoneController = TextEditingController();
  //final TextEditingController _pinPutController = TextEditingController();
  //final FocusNode _pinPutNode = FocusNode();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late PhoneNumber _validPhoneNumber;
  //final bool _isValidPhoneNumber = false;
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

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    artboard.addController(controller!);
    confetti = controller.findInput('Trigger explosion') as SMITrigger;
  }

  void signIn(BuildContext context) {
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (_fromKey.currentState!.validate()) {
        success.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
          //confetti.fire();
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          });
        });
      } else {
        error.fire();
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            isShowLoading = false;
          });
          reset.fire();
        });
      }
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'ZA');
    setState(() {
      debugPrint('phone ${number.phoneNumber}');
      _number = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginStore>(builder: (_, loginStore, __) {
      return Observer(
        builder: (_) => LoaderHud(
          inAsyncCall: loginStore.isOtpLoading,
          child: Scaffold(
            key: loginStore.loginScaffoldKey,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Form(
                    key: _fromKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Contact Number',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: InternationalPhoneNumberInput(
                            onInputChanged: (PhoneNumber number) {
                              debugPrint(
                                  'Actual phone number ${number.phoneNumber}');
                              setState(() {
                                _validPhoneNumber = number;
                              });

                              if (number.phoneNumber!.isNotEmpty &&
                                  number.phoneNumber!.length == 12) {
                                loginStore.getCodeWithPhoneNumber(
                                  context,
                                  number.phoneNumber.toString(),
                                );
                              }
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                            ),
                            ignoreBlank: false,
                            autoValidateMode: AutovalidateMode.disabled,
                            selectorTextStyle:
                                const TextStyle(color: Colors.blueGrey),
                            initialValue: _number,
                            textFieldController: phoneController,
                            formatInput: false,
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            onSaved: (PhoneNumber number) {
                              debugPrint('On saved: $number');
                            },
                            validator: (value) {
                              String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = RegExp(pattern);
                              if (value!.isEmpty) {
                                return 'Please enter mobile number';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Please enter valid mobile number';
                              }
                              return null;
                            },
                            inputDecoration: InputDecoration(
                              hintText: '76...',
                              hintStyle: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              suffixIcon: const IconButton(
                                onPressed: null,
                                icon: Icon(
                                  Icons.send_outlined,
                                ),
                              ),
                            ),
                            maxLength: 13,
                          ),
                        ),
                        const Text(
                          'Passcode',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        loginStore.isShowPasscode
                            ? Container(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: OTPTextField(
                                  length: 6,
                                  width: MediaQuery.of(context).size.width,
                                  fieldWidth: 40,
                                  style: TextStyle(fontSize: 17.sp),
                                  textFieldAlignment:
                                      MainAxisAlignment.spaceAround,
                                  fieldStyle: FieldStyle.underline,
                                  onChanged: (pin) {
                                    debugPrint('Completed: $pin');

                                    if ((pin.isNotEmpty && pin.length == 6) &&
                                        _validPhoneNumber
                                            .phoneNumber!.isNotEmpty) {
                                      debugPrint(
                                          '_validPhoneNumber: ${_validPhoneNumber.phoneNumber}');
                                      loginStore.validateOtpAndLogin(
                                          context, pin);
                                      signIn(context);
                                    }
                                  },
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  isShowLoading
                      ? CustomPositioned(
                          child: RiveAnimation.asset(
                            'assets/RiveAssets/check.riv',
                            fit: BoxFit.cover,
                            onInit: _onCheckRiveInit,
                          ),
                        )
                      : const SizedBox(),
                  isShowConfetti
                      ? CustomPositioned(
                          child: RiveAnimation.asset(
                            'assets/RiveAssets/confetti.riv',
                            fit: BoxFit.cover,
                            onInit: _onConfettiRiveInit,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, this.scale = 1, required this.child});

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            //color: Colors.black,
            height: 100,
            width: 100,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
