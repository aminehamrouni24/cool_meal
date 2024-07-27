import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/constants/constants.dart';

class Pagination extends StatelessWidget {
  const Pagination({
    super.key,
    this.onTap,
    this.refetch,
    required this.totalPages,
    this.currentPage,
    this.onPageChanged,
  });

  final void Function()? onTap;
  final Function? refetch;
  final int totalPages;
  final int? currentPage;
  final ValueChanged<int>? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      decoration: BoxDecoration(
          color: kLightWhite,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          SizedBox(
            height: 20,
            width: width * 0.8,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: totalPages,
              itemBuilder: (context, index) {
                return Container(
                  height: 18.h,
                  width: 18.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                      color: currentPage! - 1 == index ? kPrimary : kGrayLight,
                      borderRadius: BorderRadius.circular(50.r)),
                  child: GestureDetector(
                    onTap: () {
                      onPageChanged!(index);
                    },
                    child: Center(
                        child: ReusableText(
                            text: "${index + 1}",
                            style: appStyle(
                                11,
                                currentPage! - 1 == index ? kLightWhite : kGray,
                                FontWeight.normal))),
                  ),
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
