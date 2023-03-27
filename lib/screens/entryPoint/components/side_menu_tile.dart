import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: Icon(CupertinoIcons.home),
          ),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
