import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  late GlobalKey<FormState> formKey;
  late TextEditingController serachController;

  @override
  void onInit() {
    formKey = GlobalKey();
    serachController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    formKey.currentState!.dispose();
    serachController.dispose();
    ();
    super.dispose();
  }
}
