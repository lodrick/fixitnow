import 'package:fixitnow/models/message_model.dart';
import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.currentUser,
    required this.peerUser,
    required this.message,
    required this.size,
  });
  final UserModel currentUser;
  final UserModel peerUser;
  final MessageModel message;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12.0.r);
    final borderRadius = BorderRadius.all(radius);
    return Row(
      mainAxisAlignment: message.getIdFrom == currentUser.getUserId
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: <Widget>[
        currentUser.getUserId != message.getIdFrom
            ? CircleAvatar(
                radius: 16.r,
                backgroundImage: NetworkImage(peerUser.getPhotoUrl),
              )
            : const SizedBox.shrink(),
        message.getType == 0
            ? Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 9.0.w,
                  vertical: 9.0.w,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                constraints: BoxConstraints(maxWidth: 250.w),
                decoration: BoxDecoration(
                  color: currentUser.getUserId == message.getIdFrom
                      ? CustomColor.primaryColors
                      : CustomColor.primaryColorLight,
                  borderRadius: currentUser.getUserId == message.getIdFrom
                      ? borderRadius
                          .subtract(BorderRadius.only(bottomRight: radius))
                      : borderRadius
                          .subtract(BorderRadius.only(bottomLeft: radius)),
                ),
                child: Column(
                  crossAxisAlignment: currentUser.getUserId != message.getIdFrom
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      message.getText,
                      style: TextStyle(
                        color: currentUser.getUserId == message.getIdFrom
                            ? Colors.white
                            : Colors.black54,
                      ),
                      textAlign: currentUser.getUserId == message.getIdFrom
                          ? TextAlign.end
                          : TextAlign.start,
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 9.w,
                  vertical: 9.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                constraints: BoxConstraints(maxWidth: 250.w),
                decoration: BoxDecoration(
                  color: currentUser.getUserId == message.getIdFrom
                      ? CustomColor.primaryColorLight
                      : CustomColor.primaryColors,
                  borderRadius: currentUser.getUserId == message.getIdFrom
                      ? borderRadius
                          .subtract(BorderRadius.only(bottomRight: radius))
                      : borderRadius
                          .subtract(BorderRadius.only(bottomLeft: radius)),
                ),
                child: GestureDetector(
                  onTap: () {
                    debugPrint("Navigatr to FullPhoto Widget");
                  },
                  child: Image.network(
                    "src",
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        decoration: BoxDecoration(
                          color: CustomColor.primaryColors,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        width: 200.w,
                        height: 200.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, object, stackTrace) {
                      return Material(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.asset(
                          "name",
                          width: 200.r,
                          height: 200.r,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    width: 180.w,
                    height: 180.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      ],
    );
  }
}
