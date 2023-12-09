import 'package:fixitnow/screens/notification/components/circle_button.dart';
import 'package:flutter/material.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleButton(
                  press: () {
                    Navigator.of(context).pop();
                  },
                  size: size,
                  height: 38.5,
                  width: 38.5,
                  edgeInsets: EdgeInsets.only(
                    top: 0,
                    bottom: size.height * 0.006,
                  ),
                  assetsUrl: 'assets/icons/icon-back.png',
                ),
              ],
            ),
            TabBar.secondary(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(text: 'Recents'),
                Tab(text: 'Gallery'),
              ],
            ),
            TabBarView(
              controller: _tabController,
              children: const <Widget>[
                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Center(child: Text('Recents')),
                ),
                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Center(child: Text('Gallery')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
