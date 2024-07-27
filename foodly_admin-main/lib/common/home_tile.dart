
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/constants/constants.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.imagePath,
    required this.text,
    this.onTap,
  });

  final String imagePath;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            imagePath,
            width: 30.w,
            height: 30.h,
          ),
          ReusableText(text: text, style: appStyle(8, kGray, FontWeight.w500))
        ],
      ),
    );
  }
}
