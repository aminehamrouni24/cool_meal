// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/controllers/pagination/payouts_controller.dart';
import 'package:foodly_admin/hooks/fetch_payouts.dart';
import 'package:foodly_admin/models/payouts_model.dart';
import 'package:foodly_admin/views/home/screens/cashout/widgets/payout_tile.dart';
import 'package:foodly_admin/views/home/screens/restaurant/widgets/wrapper_widget.dart';
import 'package:get/get.dart';

class PendingPayouts extends HookWidget {
  const PendingPayouts({super.key});

  @override
  Widget build(BuildContext context) {
    final data = fetchPayouts('pending');
    final payouts = data.payouts;
    final isLoading = data.isLoading;
    final error = data.error;
    final refetch = data.refetch;
    final totalPages = data.totalPages;
    final currentPage = data.currentPage;
    final controller = Get.put(PayoutsPagesController());

    if (isLoading) {
      return const FoodsListShimmer();
    }

    if (payouts == null) {
      return const Center(
        child: Text("No payouts found"),
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
          controller.pending = value + 1;
          refetch!();
        },
        children: List.generate(payouts.length, (i) {
          PayoutElement payout = payouts[i];
          return PayoutTile(
            payout: payout,
            refetch: refetch,
          );
        }));
  }
}
