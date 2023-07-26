import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  final VoidCallback press;
  final RiveAnimationController _btnAnimationController;
  const AnimatedBtn(
      {Key? key,
      required RiveAnimationController btnAnimationController,
      required this.press})
      : _btnAnimationController = btnAnimationController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 236,
        child: Stack(children: [
          RiveAnimation.asset(
            "assets/RiveAssets/button.riv",
            controllers: [_btnAnimationController],
          ),
          Positioned.fill(
            top: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.arrow_right),
                const SizedBox(width: 8),
                Text(
                  'Start the course',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
