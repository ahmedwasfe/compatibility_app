import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/settings/countries.dart';
import 'package:compatibility_app/model/success_stories.dart';
import 'package:compatibility_app/model/user.dart';
import 'package:get/get.dart';

class SuccessStoriesController extends GetxController {

  RxString selectedCountry_ = ''.obs;
  int  selectedCountry = 0;

  List<SuccessStoriesUsers> listUsers = [];
  List<CountryData> listCountries = [];

  Future<void> getSuccessStories({int? countryId}) async {
    await ApiRequestes.getSuccessStories(countryId: countryId)
        .then((value) {
          if(value != null){
            listUsers.clear();
            listUsers.addAll(value.result!.users!);
            update();
          }
    });
    update();
  }

  Future<void> getCountries() async {
    await ApiRequestes.getCountries()
        .then((value) {
      if(value != null){
        listCountries.clear();
        listCountries.addAll(value.result!.countries!);
      }
    });
  }

}