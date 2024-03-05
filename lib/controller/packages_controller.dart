import 'dart:convert';
import 'dart:developer';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/subscription/subscription.dart';
import 'package:get/get.dart';

class PackagesController extends GetxController {

  List<SubscriptionData> listSubsciption = [];

  Future<void> getSubscriptions() async {
    await ApiRequestes.getSubscriptions()
        .then((value) {
          if(value != null){
            listSubsciption.clear();
            listSubsciption.addAll(value.result!.subscription!);
          }
    });
  }

}