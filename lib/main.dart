import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fixitnow/screens/common/components/camera_widget.dart';
import 'package:fixitnow/screens/onboarding/onboarding_screen.dart';
import 'package:fixitnow/stores/session/session_context.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

const mockUpHeight = 683;
const mockUpWidth = 411;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScreenUtilInit(
        builder: (context, child) {
          return MultiProvider(
            providers: [
              Provider<SessionContext>(
                create: (_) => SessionContext(),
              )
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fix It Now',
              theme: ThemeData(
                primaryColor: CustomColor.primaryColors,
                scaffoldBackgroundColor: const Color(0xFFEEF1F8),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: CustomColor.primaryColors,
                ),
                fontFamily: 'Intel',
                useMaterial3: true,
              ),
              home: const OnboardingScreen(),
            ),
          );
        },
        designSize: Size(constraints.maxWidth, constraints.maxHeight),
      );
    });
  }
}
