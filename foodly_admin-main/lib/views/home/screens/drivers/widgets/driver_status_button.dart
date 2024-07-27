import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/custom_btn.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/driver_controller.dart';
import 'package:foodly_admin/models/driver_model.dart';
import 'package:get/get.dart';

class DriverStatusButtons extends StatelessWidget {
  const DriverStatusButtons({
    super.key,
    required this.driver,
    required this.refetch,
  });

  final DriverElement? driver;
  final Function? refetch;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriverController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
              text: "Change Status",
              style: appStyle(13, kGray, FontWeight.w600)),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              driver!.verification == "Pending" ||
                      driver!.verification == "Rejected"
                  ? CustomButton(
                      onTap: () {
                        controller.updateStatus(
                            driver!.id, "Verified", refetch!);
                      },
                      text: "Accept",
                      color: kPrimary,
                      btnWidth: width / 2.15,
                      radius: 0,
                    )
                  : const SizedBox.shrink(),
              driver!.verification == "Pending"
                  ? CustomButton(
                      onTap: () {
                        controller.updateStatus(
                            driver!.id, "Rejected", refetch!);
                      },
                      text: "Reject",
                      color: kRed,
                      btnWidth: width / 2.15,
                      radius: 0,
                    )
                  : const SizedBox.shrink(),
              driver!.verification == "Verified"
                  ? CustomButton(
                      onTap: () {
                        controller.updateStatus(
                            driver!.id, "Rejected", refetch!);
                      },
                      text: "Disable",
                      color: kGray,
                      btnWidth: width / 2.15,
                      radius: 0,
                    )
                  : const SizedBox.shrink(),
              driver!.verification == "Verified"
                  ? CustomButton(
                      onTap: () {
                        // controller.deleteRestaurant(driver!.id, driver!.driver.id);
                      },
                      text: "Delete",
                      color: kRed,
                      btnWidth: width / 2.15,
                      radius: 0,
                    )
                  : const SizedBox.shrink(),
              driver!.verification == "Rejected"
                  ? CustomButton(
                      onTap: () {
                        // controller.deleteRestaurant(restaurant!.id, restaurant!.owner);
                      },
                      text: "Delete",
                      color: kRed,
                      btnWidth: width / 2.15,
                      radius: 0,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
