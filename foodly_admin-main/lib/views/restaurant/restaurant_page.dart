import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/back_ground_container.dart';
import 'package:foodly_admin/common/divida.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/status_controller.dart';
import 'package:foodly_admin/hooks/fetch_restaurant.dart';
import 'package:foodly_admin/views/restaurant/widgets/image_widget.dart';
import 'package:foodly_admin/views/restaurant/widgets/restaurant_error.dart';
import 'package:foodly_admin/views/restaurant/widgets/statistics.dart';
import 'package:foodly_admin/views/restaurant/widgets/status_buttons.dart';
import 'package:get/get.dart';

class RestaurantDetailsPage extends HookWidget {
  const RestaurantDetailsPage({super.key, required this.restaurantId});

  final String restaurantId;
  @override
  Widget build(BuildContext context) {
    final data = fetchRestaurant(restaurantId);
    final restaurant = data.restaurant;
    final ordersTotal = data.ordersTotal;
    final cancelledOrders = data.cancelledOrders;
    final processingOrders = data.processingOrders;
    final revenueTotal = data.revenueTotal;
    final isLoading = data.isLoading;
    final error = data.error;
    final refetch = data.refetch;

    if (isLoading) {
      return const Scaffold(
          body: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: FoodsListShimmer(),
      ));
    }

    if (error != null) {
      return const Center(
        child: Text("An error occured"),
      );
    }

    if (restaurant == null) {
      return const RestaurantError();
    }

    return Scaffold(
      body: Scaffold(
        body: BackGroundContainer(
            child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            ImageWidget(restaurant: restaurant),
            StatusButtons(
              restaurant: restaurant,
              refetch: refetch,
            ),
            // Restaurant name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ReusableText(
                  text: "${restaurant.title} Statistics",
                  style: appStyle(12, kGray, FontWeight.w600)),
            ),

            //Restaurant Statistics
            Statistics(
              ordersTotal: ordersTotal,
              cancelledOrders: cancelledOrders,
              processingOrders: processingOrders,
              revenueTotal: restaurant.earnings.toDouble(),
            ),

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
      ),
    );
  }
}
