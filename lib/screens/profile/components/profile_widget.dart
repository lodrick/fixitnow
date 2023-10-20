import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.imageUrl,
    required this.onPress,
  });
  final String imageUrl;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: <Widget>[
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4.h,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imageUrl);
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onPress),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        child: buildCircle(
            child: const Icon(
              Icons.edit,
              color: Colors.white,
              size: 20,
            ),
            all: 8,
            color: color),
        all: 3,
        color: Colors.white,
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
