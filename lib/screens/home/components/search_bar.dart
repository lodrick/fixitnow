import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Container(
      //width: size.width * .5,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 3),
            blurRadius: 20.r,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              debugPrint(value);
            },
            style: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.6.sp),
              fontSize: 18.0.sp,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.r),
                ),
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w700,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
