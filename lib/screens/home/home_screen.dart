import 'package:fixitnow/models/role_model.dart';
import 'package:fixitnow/models/service.dart';
import 'package:fixitnow/models/user.dart';
import 'package:fixitnow/screens/home/components/service_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /*@override
  void initState() {
    super.initState();
  }*/

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ServiceModel> serviceModel = [];
    Set<RoleModel> setRole = Set();
    UserModel userModel = UserModel(1, 'Lod', 'Mj', '_about', '_email',
        '_photoUrl', '_phoneNumber', setRole);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.70,
                width: MediaQuery.of(context).size.width,
                child: ServiceWidget(
                  services: serviceModel,
                  size: MediaQuery.of(context).size,
                  userModel: userModel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
