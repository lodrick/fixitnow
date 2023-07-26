import 'package:fixitnow/screens/entryPoint/entry_point.dart';
import 'package:fixitnow/screens/home/home_screen.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return Scaffold(
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
            buildRegisterPane(context),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterPane(BuildContext context) => SliverToBoxAdapter(
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
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const EntryPoint(widget: HomeScreen()),
                        ),
                      );
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColor.primaryColors,
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
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
              )
            ],
          ),
        ),
      );
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