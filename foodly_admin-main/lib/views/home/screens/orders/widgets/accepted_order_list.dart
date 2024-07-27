import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/controllers/pagination/Orders_controller.dart';
import 'package:foodly_admin/hooks/fetch_orders.dart';
import 'package:foodly_admin/views/home/screens/orders/widgets/order_tile.dart';
import 'package:foodly_admin/views/home/screens/restaurant/widgets/wrapper_widget.dart';
import 'package:get/get.dart';

class DeliveringOrders extends HookWidget {
  const DeliveringOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(OrderPagesController());
    final data = fetchOrders(1, 6, "Out_for_delivery");

    final orders = data.orders;
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

    if (orders != null && orders.isEmpty) {
      return const Center(
        child: Text("No orders found"),
      );
    }

    return WrapperWidget(
        currentPage: currentPage,
        refetch: refetch,
        totalPages: totalPages,
        onPageChanged: (int value) {
          controller.delivering = value + 1;
          refetch!();
        },
        children: List.generate(orders!.length, (index) {
          final order = orders[index];
          return OrderTile(order: order);
        }));
  }
}
