import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/common/verification_modal.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/models/users_model.dart';

class UserTile extends StatelessWidget {
  const UserTile(
      {super.key,
      required this.context,
      required this.user,
      required this.index});

  final BuildContext context;
  final User user;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: width,
      decoration: BoxDecoration(
        color: kOffWhite,
        border: Border.all(
          color: kLightWhite,
        ),
        borderRadius: index == 0
            ? const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(user.profile),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: user.username,
                  style: appStyle(10, kGray, FontWeight.w500),
                ),
                ReusableText(
                  text: user.email,
                  style: appStyle(9, kGray, FontWeight.normal),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 70.w,
              height: 20,
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: ReusableText(
                    text: user.userType,
                    style: appStyle(11, kLightWhite, FontWeight.w400)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {
    showVerificationSheet(context);
  }
}
