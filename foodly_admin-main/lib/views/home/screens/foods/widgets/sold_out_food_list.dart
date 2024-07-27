import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/controllers/pagination/food_pagination_controller.dart';
import 'package:foodly_admin/hooks/fetch_foods.dart';
import 'package:foodly_admin/models/foods.dart';
import 'package:foodly_admin/views/home/screens/foods/widgets/food_tile.dart';
import 'package:foodly_admin/views/home/screens/restaurant/widgets/wrapper_widget.dart';
import 'package:get/get.dart';

class SoldOutFoodlist extends HookWidget {
  const SoldOutFoodlist({super.key});

  @override
  Widget build(BuildContext context) {
    final data = fetchFood(1, 5, false);
    final foods = data.foods;
    final isLoading = data.isLoading;
    final error = data.error;
    final refetch = data.refetch;
    final totalPages = data.totalPages;
    final currentPage = data.currentPage;
    final controller = Get.put(FoodPagesController());

    if (isLoading) {
      return const FoodsListShimmer();
    }

    if (foods == null) {
      return const Center(
        child: Text("An error occured"),
      );
    }

    if (error != null) {
      return const Center(
        child: Text("An error occured"),
      );
    }

    if (foods.isEmpty) {
      return const Center(
        child: Text("No foods found"),
      );
    }
     return WrapperWidget(
        currentPage: currentPage,
        refetch: refetch,
        totalPages: totalPages,
        onPageChanged: (int value) {
          controller.soldout = value + 1;
          refetch!();
        },
        children: List.generate(foods.length, (i) {
          Food food = foods[i];
          return FoodTile(food: food);
        }));
  }
}
