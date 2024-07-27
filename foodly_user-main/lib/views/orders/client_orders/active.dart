import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_user/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_user/constants/constants.dart';
import 'package:foodly_user/hooks/fetchOrders.dart';
import 'package:foodly_user/models/client_orders.dart';
import 'package:foodly_user/views/orders/widgets/client_order_tile.dart';

class ActiveOrders extends HookWidget {
  const ActiveOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(PickedController());
    final hookResult = useFetchClientOrders('orderStatus', 'Out_for_Delivery');
    List<ClientOrders>? orders = hookResult.data;
    final isLoading = hookResult.isLoading;
    final refetch = hookResult.refetch;

    // controller.setOnStatusChangeCallback(refetch);

    return Container(
      height: hieght / 1.3,
      width: width,
      color: kLightWhite,
      child: isLoading
          ? const FoodsListShimmer()
          : ListView.builder(
              padding: EdgeInsets.only(top: 10.h, left: 12.w, right: 12.w),
              itemCount: orders!.length,
              itemBuilder: (context, i) {
                ClientOrders order = orders[i];
                return ClientOrderTile(order: order);
              }),
    );
  }
}
