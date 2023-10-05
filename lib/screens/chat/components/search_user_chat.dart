import 'package:fixitnow/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchUserChart extends StatelessWidget {
  const SearchUserChart({
    super.key,
    required this.searchText,
    required this.hitSearchText,
    required this.onPress,
    required this.size,
  });
  final String searchText;
  final String hitSearchText;
  final VoidCallback onPress;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.primaryScaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      child: Row(
        children: <Widget>[
          const Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colors.grey,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                debugPrint(value);
              },
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: hitSearchText,
                contentPadding: EdgeInsets.symmetric(
                  vertical: -10,
                  horizontal: size.width * 0.01,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onPress,
            child: const Icon(
              FontAwesomeIcons.filter,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
