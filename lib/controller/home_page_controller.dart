import 'dart:developer';

import 'package:compatibility_app/api/api_requestes.dart';
import 'package:compatibility_app/model/sliders.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class HomePageController extends GetxController {

  late GlobalKey<FormState> formKey;
  late TextEditingController serachController;

  int rate = 0;

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



  List<SliderData> listSliders = [];

  Future<void> getSliders() async {
    await ApiRequestes.getSliders()
        .then((value) {
          if(value != null){
            listSliders.clear();
            listSliders.addAll(value.result!.sliders!);
          }
    });
  }

  void showRatingApp(BuildContext context){
    showDialog(context: context, builder: (con) => AlertDialog(
      clipBehavior: Clip.antiAlias,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
            width: double.infinity,
            height: 320.h,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(start: 10.r, end: 10.r),
                  child: AppText.medium(text:
                  'rating'.tr,
                    color: AppColors.lightgray,
                    fontSize:16.sp,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(top: 20.r),
                  alignment: AlignmentDirectional.center,
                  child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    onRatingUpdate: (rating) {
                      rate = rating.toInt();
                      log('RATING: ${rate}');
                    },
                  ),
                ),
                Container(
                    padding: EdgeInsetsDirectional.only(top: 10.r,start: 15.r
                        ,end: 15.r
                    ),
                    alignment: Alignment.center,
                    child: AppWidgets.CustomButton(text: 'submit_review'.tr,
                      isUpperCase: false,
                      fontSize: 15.h,
                      click:(){
                      if(rate == 0){
                        AppHelper.showToast(message: 'Please enter your rate'.tr);
                      }else {
                        addReview(context, rate);
                        // Navigator.pop(context);
                      }
                      },
                      height: 43.h,radius: 6.r,
                    )),
              ],
            )
        ),
      ),
    ));
  }

  void showSuccessRate(BuildContext context) async {
    showDialog(context: context, builder: (con) {
      Future.delayed(Duration(seconds: 2), () => Navigator.pop(context));
      return AlertDialog(
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 200.h,
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('${Const.icons}icon_success.svg'),
                  SizedBox(height: 20.h),
                  AppText.medium(text: 'thanks_rate_app', maxline: 2, textAlign: TextAlign.center)
                ],
              )
          ),
        ),
      );
    });
  }

  void addReview(BuildContext context, int rate) {
    ApiRequestes.addReview(rate: rate)
        .then((value) {
          if(value != null){
            showSuccessRate(context);
          }else {
            // showSuccessRate(context);
            Navigator.pop(context);
          }
    }, onError: (err) {
      Navigator.pop(context);
    });
  }
}
