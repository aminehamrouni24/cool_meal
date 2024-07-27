import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/home_tile.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/home_controller.dart';
import 'package:foodly_admin/views/home/screens/more/more_page.dart';
import 'package:get/get.dart';

class HomeTilesHolder extends StatelessWidget {
  const HomeTilesHolder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      height: 125.h,
      width: width,
      color: kOffWhite,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.w),
        width: width,
        decoration: BoxDecoration(
            color: kLightWhite, borderRadius: BorderRadius.circular(12.r)),
        child: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 6.0, 
              mainAxisSpacing: 6.0, 
            ),
            itemCount: tiles.length,
            itemBuilder: (context, index) {
              final tile = tiles[index];
              return HomeTile(
                imagePath: tile['imagePath'],
                text: tile['title'],
                onTap: () {
                  if (tile['title'] == "More") {
                    Get.to(() => const MorePage(),
                    transition: Transition.downToUp,
                    duration: const Duration(milliseconds: 500)
                    );
                  } else {
                    controller.updatePage = tile['title'];
                    controller.updateImage = tile['imagePath'];
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
