import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/controllers/pagination/users_page_controller.dart';
import 'package:foodly_admin/hooks/fetch_users.dart';
import 'package:foodly_admin/models/users_model.dart';
import 'package:foodly_admin/views/home/screens/restaurant/widgets/wrapper_widget.dart';
import 'package:foodly_admin/views/home/screens/users/widgets/user_tile.dart';
import 'package:get/get.dart';

class UnVerifiedUsersList extends HookWidget {
  const UnVerifiedUsersList({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserPagesController());
    final data = fetchUsers(false, 1, 5);
    final users = data.users;
    final isLoading = data.isLoading;
    final error = data.error;
    final refetch = data.refetch;
    final totalPages = data.totalPages;
    final currentPage = data.currentPage;

    if (isLoading) {
      return const FoodsListShimmer();
    }

    if (users == null || users.isEmpty) {
      return const Center(
        child: Text("No Users found"),
      );
    }

    if (error != null) {
      return const Center(
        child: Text("An error occured"),
      );
    }
    return WrapperWidget(
        currentPage: currentPage,
        refetch: refetch,
        totalPages: totalPages,
        onPageChanged: (int value) {
          controller.unverified = value + 1;
          refetch!();
        },
        children: List.generate(users.length, (index) {
          User user = users[index];
          return UserTile(
            context: context,
            user: user,
            index: index,
          );
        }));
  }
}
