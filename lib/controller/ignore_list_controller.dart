import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/ignore/ignore.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:get/get.dart';

class IgnoreListController extends GetxController {

  List<User> listUsers = [];


  Future<void> getUsersIgnore() async {
    await ApiRequestes.getUsersIgnore()
        .then((value) {
          if(value != null){
            listUsers.clear();
            listUsers.addAll(value.result!.users!);
          }
    });
  }

}