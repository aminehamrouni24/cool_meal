import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly_admin/common/app_style.dart';
import 'package:foodly_admin/common/back_ground_container.dart';
import 'package:foodly_admin/common/custom_btn.dart';
import 'package:foodly_admin/common/reusable_text.dart';
import 'package:foodly_admin/constants/constants.dart';
import 'package:foodly_admin/controllers/add_category_controller.dart';
import 'package:foodly_admin/controllers/image_upload_controller.dart';
import 'package:foodly_admin/models/add_category_model.dart';
import 'package:foodly_admin/views/auth/widgets/email_textfield.dart';
import 'package:get/get.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  final TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final imageUploader = Get.put(ImageUploadController());
    final controller = Get.put(AddCategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        title: ReusableText(
            text: "Add Categories",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: kLightWhite,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          children: [
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                imageUploader.pickImage("one");
              },
              child: Container(
                height: 120.h,
                width: width / 2.3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: kGrayLight)),
                child: Obx(
                  () => imageUploader.imageOneUrl == ""
                      ? Center(
                          child: Text(
                            "Upload Image",
                            style: appStyle(16, kGray, FontWeight.w600),
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            imageUploader.imageOneUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ReusableText(
                text: "Category Title",
                style: appStyle(13, kGray, FontWeight.w600)),
            SizedBox(
              height: 10.h,
            ),
            EmailTextField(
              controller: _title,
              prefixIcon: const Icon(Ionicons.md_add_circle),
              hintText: "Category Title",
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              onTap: () {
                if (imageUploader.imageOne != "") {
                  var model = AddCategoryModel(
                    title: _title.text,
                    value: _title.text.toLowerCase(),
                    imageUrl: imageUploader.imageOneUrl,
                  );

                  String data = addCategoryModelToJson(model);

                  controller.addCategory(data);
                }
              },
              text: "Submit",
              btnHieght: 35.h,
              color: kPrimary,
            )
          ],
        ),
      ),
    );
  }
}
