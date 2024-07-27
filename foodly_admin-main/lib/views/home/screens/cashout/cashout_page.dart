import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/common/heading_titles_widget.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/views/home/screens/cashout/cashout_tab.dart';
import 'package:foodly_admin/views/home/screens/cashout/widgets/completed_payouts.dart';
import 'package:foodly_admin/views/home/screens/cashout/widgets/failed_payouts.dart';
import 'package:foodly_admin/views/home/screens/cashout/widgets/pending_payouts.dart';

class CashoutPage extends StatefulWidget {
  const CashoutPage({super.key});

  @override
  State<CashoutPage> createState() => _CashoutPageState();
}

class _CashoutPageState extends State<CashoutPage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: 3,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child:  Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          color: kOffWhite,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              const HeadingTitlesWidget(title: "CashOut",),
              SizedBox(
                height: 10.h,
              ),
              CashOutTab(tabController: _tabController),
              SizedBox(
                height: 10.h,
              ),

              SizedBox(
                height: hieght * 0.59,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: kLightWhite,
                         height: hieght * 0.59,
                        child: TabBarView(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const [
                            PendingPayouts(),
                            CompletedPayouts(),
                            FailedPayouts()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
          
            ],
          ),
        ),
      );
  
  }
}
