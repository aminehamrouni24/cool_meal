// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/views/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class StatusController extends GetxController {
  Function? refecthList;

  void setData(Function getList) {
    refecthList = getList;
  }

  final box = GetStorage();

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) => _isLoading.value = value;

  void updateStatus(String id, String query, Function refetch) async {
    setLoading = true;

    String accessToken = box.read('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var url = Uri.parse('$appBaseUrl/api/restaurants/status/$id?status=$query');
    try {
      final response = await http.put(url, headers: headers);

      if (response.statusCode == 200) {
        setLoading = false;
        refetch();
        refecthList!();

        Get.snackbar("Status Updated", "Enjoy your awesome experience",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(Ionicons.fast_food_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void deleteRestaurant(String id, String query) async {
    setLoading = true;

    String accessToken = box.read('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var url = Uri.parse('$appBaseUrl/api/restaurants/$id?owner=$query');
    try {
      final response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        setLoading = false;
        Get.to(() => const HomePage());

        Get.snackbar("Restaurant sucessful deleted", "Enjoy your awesome experience",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(Ionicons.fast_food_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
