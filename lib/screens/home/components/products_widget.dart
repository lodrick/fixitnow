import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({
    super.key,
    required this.productMap,
    required this.size,
  });
  final Map<String, IconData> productMap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 50.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        scrollDirection: Axis.horizontal,
        itemCount: productMap.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF1F8),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  productMap.entries.toList()[index].value,
                  size: 20.sp,
                ),
                SizedBox(width: 5.w),
                Text('${productMap.entries.toList()[index].key} '),
              ],
            ),
          );
        },
      ),
    );
  }
}
