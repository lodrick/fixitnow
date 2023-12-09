import 'dart:io';

import 'package:fixitnow/models/file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowImageWidget extends StatelessWidget {
  const RowImageWidget({super.key, required this.fileModel});
  final FileModel fileModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: fileModel.files.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(right: 3.w),
            child: Image(
              image: FileImage(
                File(fileModel.files[index]),
                scale: 2,
              ),
              width: 90.w,
              height: 90.h,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
