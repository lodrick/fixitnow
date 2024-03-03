import 'package:fixitnow/models/menu.dart';
import 'package:fixitnow/screens/entryPoint/entry_point.dart';
import 'package:fixitnow/screens/loader_hub.dart';
import 'package:fixitnow/stores/session/session_context.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../utils/rive_utils.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;
  @override
  Widget build(BuildContext context) {
    return Consumer<SessionContext>(builder: (_, sessionContext, __) {
      return Observer(
        builder: (_) => LoaderHud(
          inAsyncCall: false,
          loading: Container(),
          child: SafeArea(
            child: Container(
              width: 288,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: CustomColor.primaryColors,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoCard(
                      name:
                          '${sessionContext.currentUser!.firstName} ${sessionContext.currentUser!.lastName}',
                      bio: "YouTuber",
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                      child: Text(
                        "Browse".toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white70),
                      ),
                    ),
                    ...sidebarMenus
                        .map((menu) => SideMenu(
                              menu: menu,
                              selectedMenu: selectedSideMenu,
                              press: () {
                                RiveUtils.chnageSMIBoolState(menu.rive.status!);
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => menu.widget,
                                  ),
                                );
                                setState(() {
                                  selectedSideMenu = menu;
                                });
                              },
                              riveOnInit: (artboard) {
                                menu.rive.status = RiveUtils.getRiveInput(
                                    artboard,
                                    stateMachineName:
                                        menu.rive.stateMachineName);
                              },
                            ))
                        .toList(),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                      child: Text(
                        "History".toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white70),
                      ),
                    ),
                    ...sidebarMenus2
                        .map((menu) => SideMenu(
                              menu: menu,
                              selectedMenu: selectedSideMenu,
                              press: () {
                                RiveUtils.chnageSMIBoolState(menu.rive.status!);
                                setState(() {
                                  selectedSideMenu = menu;

                                  debugPrint('${menu.widget}');
                                });
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EntryPoint(widget: menu.widget),
                                  ),
                                );
                              },
                              riveOnInit: (artboard) {
                                menu.rive.status = RiveUtils.getRiveInput(
                                    artboard,
                                    stateMachineName:
                                        menu.rive.stateMachineName);
                              },
                            ))
                        .toList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
