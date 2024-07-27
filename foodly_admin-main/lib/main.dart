import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/firebase_options.dart';
import 'package:foodly_admin/services/notification_service.dart';
import 'package:foodly_admin/views/auth/login_page.dart';
import 'package:foodly_admin/views/auth/verification_page.dart';
import 'package:foodly_admin/views/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async {
  print(
      "onBackground: ${message.notification?.title}/${message.notification?.body}/${message.notification?.titleLocKey}");
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Widget defaultHome = const Login();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await NotificationService().initialize(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String? token = box.read('token');
    bool? verification = box.read("verification");

    if (token != null && verification == false) {
      defaultHome = const VerificationPage();
    } else if (token != null && verification == true) {
      defaultHome = const HomePage();
    }
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cool Admin',
            theme: ThemeData(
              scaffoldBackgroundColor: kOffWhite,
              iconTheme: const IconThemeData(color: kDark),
              primarySwatch: Colors.grey,
            ),
            home: defaultHome,
            navigatorKey: navigatorKey,
            // routes: {
            //   // '/order_details_page': (context) => const OrderDetailsPage(),
            // },
          );
        });
  }
}
