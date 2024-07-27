import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/back_ground_container.dart';
import 'package:foodly_admin/common/divida.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/models/driver_model.dart';
import 'package:foodly_admin/views/home/screens/drivers/widgets/driver_status_button.dart';

class DriverDetails extends StatefulWidget {
  const DriverDetails({super.key, required this.id, required this.driver, required this.refetch});

  final String id;
  final DriverElement driver;
  final Function refetch;

  @override
  State<DriverDetails> createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "Driver Details and Statistics",
          style: appStyle(13, kGray, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
          child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          DriverStatusButtons(
            driver: widget.driver,
            refetch: () {
              widget.refetch();
            },
          ),
          // Restaurant name
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ReusableText(
                text: "Driver Statistics",
                style: appStyle(12, kGray, FontWeight.w600)),
          ),

          //Restaurant Statistics
          // Statistics(
          //   ordersTotal: ordersTotal,
          //   cancelledOrders: cancelledOrders,
          //   processingOrders: processingOrders,
          //   revenueTotal: revenueTotal,
          // ),

          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "Withdrawal History",
                      style: appStyle(12, kGray, FontWeight.w600)),

                  // Withdrawal History
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                              text: "0",
                              style: appStyle(14, kGray, FontWeight.w600)),
                          ReusableText(
                              text: "Total Withdrawals",
                              style: appStyle(10, kGray, FontWeight.normal)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                              text: "0",
                              style: appStyle(14, kGray, FontWeight.w600)),
                          ReusableText(
                              text: "Pending Withdrawals",
                              style: appStyle(10, kGray, FontWeight.normal)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ReusableText(
                              text: "0",
                              style: appStyle(14, kGray, FontWeight.w600)),
                          ReusableText(
                              text: "Completed Withdrawals",
                              style: appStyle(10, kGray, FontWeight.normal)),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          const Divida(),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                    text: "Send Notifications",
                    style: appStyle(12, kGray, FontWeight.w600)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          AntDesign.bells,
                          color: kGrayLight,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(AntDesign.mail, color: kGrayLight)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(AntDesign.phone, color: kGrayLight)),
                  ],
                ),
              ],
            ),
          ),

          const Divida(),
        ],
      )),
    );
  }
}
