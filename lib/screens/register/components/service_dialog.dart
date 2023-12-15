import 'package:fixitnow/screens/register/components/service_form.dart';
import 'package:flutter/material.dart';

void showCustomServiceDialog(BuildContext context,
    {required ValueChanged onValue}) {
  showGeneralDialog(
      context: context,
      barrierLabel: 'Barrier',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(.5),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: 620,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF1F8),
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  offset: const Offset(0, 30),
                  blurRadius: 60,
                ),
                const BoxShadow(
                  color: Colors.black45,
                  offset: Offset(0, 30),
                  blurRadius: 60,
                )
              ],
            ),
            child: const Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: <Widget>[
                      Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Expanded(child: ServiceForm())
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }).then(onValue);
}
