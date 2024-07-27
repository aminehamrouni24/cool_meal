// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddCategoryController extends GetxController {
  final box = GetStorage();

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) => _isLoading.value = value;

  void addCategory(String data) async {
    setLoading = true;

    String accessToken = box.read('token');

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    var url = Uri.parse('$appBaseUrl/api/categories');

    try {
      final response = await http.post(url, headers: headers, body: data);

      if (response.statusCode == 201) {
        Get.snackbar("Successfully added a category ", "Enjoy your awesome experience",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(Ionicons.fast_food_outline));
        setLoading = false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
