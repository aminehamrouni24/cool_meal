import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/pagination.dart';
import 'package:foodly_admin/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/pagination/feedback_controller.dart';
import 'package:foodly_admin/hooks/fetch_feedback.dart';
import 'package:foodly_admin/views/home/screens/reviews/feed_viewer.dart';
import 'package:get/get.dart';

class FeedbackList extends HookWidget {
  const FeedbackList({super.key});

  @override
  Widget build(BuildContext context) {
    final pagination = Get.put(FeedbackController());
    final data = fetchFeedback();
    final feeds = data.feeds;
    final isLoading = data.isLoading;
    final error = data.error;
    final refetch = data.refetch;
    final totalPages = data.totalPages;
    final currentPage = data.currentPage;
    pagination.setData(data.refetch!);

    if (isLoading) {
      return const FoodsListShimmer();
    }

    if (feeds!.isEmpty) {
      return const Center(
        child: Text("No feeds found"),
      );
    }

    if (error != null) {
      return const Center(
        child: Text("An error occured"),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        color: kLightWhite,
        height: hieght * 0.6,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: hieght * 0.56,
              child: ListView(
                children: List.generate(feeds.length, (index) {
                  final feed = feeds[index];
                  return Container(
                      margin: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                          color: kOffWhite,
                          borderRadius: BorderRadius.circular(12.r)),
                      height: 80,
                      child: ListTile(
                        onTap: () {
                          Get.to(() => FeedViewer(
                                feed: feed,
                              ));
                        },
                        leading: Image.network(feed.imageUrl),
                        title: Text(feed.userId,
                            style: appStyle(10, kGray, FontWeight.normal)),
                        subtitle: Text(feed.message,
                            style: appStyle(10, kGray, FontWeight.normal)),
                      ));
                }),
              ),
            ),
            Pagination(
              currentPage: currentPage,
              refetch: refetch,
              totalPages: totalPages,
              onPageChanged: (int value) {
                pagination.available = value + 1;
                refetch!();
              },
            )
          ],
        ),
      ),
    );
  }
}
