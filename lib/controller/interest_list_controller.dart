import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:get/get.dart';

class InterestListController extends GetxController {

  List<User> listUsers = [];

  Future<void> getUsersInterest() async {
    await ApiRequestes.getUsersInterest()
        .then((value) {
          if(value != null){
            listUsers.clear();
            listUsers.addAll(value.result!.users!);
          }
    });
  }
}