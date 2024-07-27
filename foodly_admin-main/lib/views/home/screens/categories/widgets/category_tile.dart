import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/models/categories.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: kPrimary.withOpacity(0.4),
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(width: 10.w,),
              ReusableText(
                  text: category.title,
                  style: appStyle(12, kGray, FontWeight.normal)),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: kGray,
            size: 15,
          ),
        ],
      ),
    );
  }
}
