import 'package:fixitnow/models/user_model.dart';
import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class NewMessageWidget extends StatefulWidget {
  const NewMessageWidget({
    super.key,
    required this.currentUser,
    required this.peerUser,
  });
  final UserModel currentUser;
  final UserModel peerUser;

  @override
  State<NewMessageWidget> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _textController = TextEditingController();
  String _message = '';

  getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile = (await imagePicker.pickImage(
        source: ImageSource.gallery)) as PickedFile;

    debugPrint(pickedFile.path);
  }

  sendMessage() async {
    FocusScope.of(context).unfocus();
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: CustomColor.primaryColors.withOpacity(.2)),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: getImage,
            icon: const Icon(
              Icons.photo,
              color: CustomColor.primaryColors,
            ),
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              //minLines: 3,
              //maxLength: 10,
              enableSuggestions: true,
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
              onChanged: (value) => setState(() {
                _message = value;
              }),
            ),
          ),
          SizedBox(width: 20.w),
          GestureDetector(
            onTap: _message.trim().isEmpty ? null : sendMessage,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomColor.primaryColors.withOpacity(.15),
                ),
              ),
              child: Transform.rotate(
                angle: 0,
                child: const Icon(
                  Icons.send_outlined,
                  color: CustomColor.primaryColors,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
