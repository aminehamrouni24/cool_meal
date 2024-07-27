import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/controllers/pagination/pagination_controller.dart';
import 'package:foodly_admin/controllers/status_controller.dart';
import 'package:foodly_admin/hooks/fetch_restaurants.dart';
import 'package:foodly_admin/views/home/screens/restaurant/widgets/restaurant_tile.dart';
import 'package:foodly_admin/views/home/screens/restaurant/widgets/wrapper_widget.dart';
import 'package:get/get.dart';

class PendingRestaurants extends HookWidget {
  const PendingRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(StatusController());
    final pagination = Get.put(PaginationController());
    final data = fetchRestaurants("Pending", 1, 5);
    final restaurants = data.restaurants;
    final isLoading = data.isLoading;
    final error = data.error;
    final refetch = data.refetch;
    final totalPages = data.totalPages;
    final currentPage = data.currentPage;
    controller.setData(data.refetch!);

    if (isLoading) {
      return const FoodsListShimmer();
    }

    // if (restaurants!.isEmpty) {
    if (restaurants != null) {
      return const Center(
        child: Text("No restaurants found"),
      );
    }

    if (error != null) {
      return const Center(
        child: Text("An error occured"),
      );
    }

    if (restaurants != null) {
      return WrapperWidget(
        currentPage: currentPage,
        refetch: refetch,
        totalPages: totalPages,
        onPageChanged: (int value) {
          pagination.pendingRestaurants = value + 1;
          refetch!();
        },
        children: List.generate(restaurants as int, (index) {
          final restaurant = restaurants[index];
          // Check if restaurant is null before creating a tile
          if (restaurant != null) {
            return RestaurantTile(restaurant: restaurant);
          } else {
            // Handle null restaurant (optional)
            return Container(); // or any other widget you want to show for null restaurant
          }
        }),
      );
    } else {
      // Handle case where restaurants is null (optional)
      return Container(); // or any other widget to handle the null case
    }

    // return WrapperWidget(
    //     currentPage: currentPage,
    //     refetch: refetch,
    //     totalPages: totalPages,
    //     onPageChanged: (int value) {
    //       pagination.pendingRestaurants = value + 1;
    //       refetch!();
    //     },
    //     // children: List.generate(restaurants!, (index) {
    //     children: List.generate(restaurants!, (index) {

    //       final restaurant = restaurants[index];
    //       return RestaurantTile(restaurant: restaurant);
    //     }));

    // children: List.generate(restaurants.length, (index) {
    //   final restaurant = restaurants[index];
    //   return RestaurantTile(restaurant: restaurant);
    // }));
  }
}
