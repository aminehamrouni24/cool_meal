import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/pagination.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/pagination/drivers_page_controller.dart';
import 'package:foodly_admin/hooks/fetch_drivers.dart';
import 'package:foodly_admin/views/home/screens/drivers/widgets/driver_tile.dart';
import 'package:get/get.dart';

class RejectedDrivers extends HookWidget {
  const RejectedDrivers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DriversPagesController());
    final data = fetchDrivers("Rejected");

    final drivers = data.drivers;
    final isLoading = data.isLoading;
    final refetch = data.refetch;
    final totalPages = data.totalPages;
    final currentPage = data.currentPage;
    final error = data.error;

    if (isLoading) {
      return const FoodsListShimmer();
    }

    if (error != null) {
      return Center(
        child: Text(error.message),
      );
    }

    if (drivers != null && drivers.isEmpty) {
      return const Center(
        child: Text("No drivers found"),
      );
    }

    if (drivers == null) {
      return const Center(
        child: Text("Error fetching driver information"),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: SizedBox(
        height: hieght * 0.52,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: hieght * 0.42,
              child: ListView(
                children: List.generate(drivers.length, (index) {
                  final driver = drivers[index];
                  return DriverTile(driver: driver);
                }),
              ),
            ),
            Pagination(
              currentPage: currentPage,
              refetch: refetch,
              totalPages: totalPages,
              onPageChanged: (int value) {
                controller.rejected = value + 1;
                refetch!();
              },
            )
          ],
        ),
      ),
    );
  }
}
