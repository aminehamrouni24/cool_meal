import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/pagination.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/pagination/pagination_controller.dart';
import 'package:foodly_admin/hooks/fetch_categories.dart';
import 'package:foodly_admin/models/categories.dart';
import 'package:foodly_admin/views/home/screens/categories/widgets/category_tile.dart';
import 'package:get/get.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaginationController());
    controller.resetPage();

    final data = fetchCategories(1, 5);
    final categories = data.categories;
    final isLoading = data.isLoading;
    final error = data.error;
    final refetch = data.refetch;
    final totalPages = data.totalPages;
    final currentPage = data.currentPage;


    if (isLoading) {
      return const FoodsListShimmer();
    }

    if (categories == null) {
      return const Center(
        child: Text("No Categories found"),
      );
    }

    if (error != null) {
      return const Center(
        child: Text("An error occured"),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      height: hieght * 0.6,
      child: Column(
        children: [
          SizedBox(
            height: hieght * 0.56,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  Category category = categories[index];
                  return CategoryTile(category: category);
                }),
          ),
            Pagination(
              currentPage: currentPage,
              refetch: refetch,
              totalPages: totalPages,
              onPageChanged: (int value) {
                controller.categories = value + 1;
                refetch!();
              },
            )
        ],
      ),
    );
  }
}




