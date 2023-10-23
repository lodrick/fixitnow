import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoaderHud extends StatelessWidget {
  LoaderHud({
    super.key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.dismissble = false,
    required this.child,
  });
  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator = Container(
    width: 200.w,
    height: 200.h,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: CustomColor.primaryColors.withOpacity(.7)),
    child: const Center(child: CircularProgressIndicator()),
  );
  final bool dismissble;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!inAsyncCall) return child;
    return Stack(
      children: <Widget>[
        child,
        Opacity(
          opacity: opacity,
          child: ModalBarrier(
            dismissible: dismissble,
            color: color,
          ),
        ),
        Center(child: progressIndicator),
      ],
    );
  }
}
