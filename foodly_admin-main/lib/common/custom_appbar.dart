
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/login_controller.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 6),
      height: 110,
      color: kOffWhite,
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w, bottom: 2.h),
                        child: Text("Welcome to ",
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(11, kDark, FontWeight.w500)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 12.w),
                        width: width / 1.9,
                        decoration: BoxDecoration(
                          gradient: buttonGradient(),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25.r),
                              bottomRight: Radius.circular(25.r)),
                        ),
                        child: ReusableText(
                            text: "Foodly Admin Panel",
                            style: appStyle(16, kLightWhite, FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                  onTap: () {
                    controller.logout();
                  },
                  child: SvgPicture.asset("assets/icons/shutdown.svg")),
            )
          ],
        ),
      ),
    );
  }

  String getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return "☀️";
    } else if (hour >= 12 && hour < 17) {
      return "🌤️";
    } else {
      return "🌙";
    }
  }

  String profile =
      'https://d326fntlu7tb1e.cloudfront.net/uploads/51530ae8-32b8-4a04-89b3-17f40a2f4cc1-avatar.png';
}
