import 'package:compatibility_app/controller/boarding_controller.dart';
import 'package:compatibility_app/controller/language_controller.dart';
import 'package:compatibility_app/model/boardings.dart';
import 'package:compatibility_app/model/language.dart';
import 'package:compatibility_app/routes/routes.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatelessWidget {
  BoardingController _controller=Get.put(BoardingController());
  LanguageController controller=Get.put(LanguageController());

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: GetBuilder<BoardingController>(builder: (controller) => Stack(
      children: [
        LiquidSwipe.builder(
            itemCount: _controller.listBoarding.length,
            itemBuilder: (_, index) => pageViewScreens(_controller.listBoarding[index]),
            waveType: WaveType.liquidReveal,
            liquidController: _controller.liquidController,
            slideIconWidget: Icon(AppHelper.getAppLanguage() == 'ar' ? Icons.arrow_forward_ios : Icons.arrow_back_ios),
            enableSideReveal: true,
            onPageChangeCallback: controller.onPageChangeCallback),
        Container(
          margin: EdgeInsetsDirectional.only(top: 640.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: AnimatedSmoothIndicator(
                      activeIndex: _controller.liquidController.currentPage,
                      count: _controller.listBoarding.length,
                      effect: CustomizableEffect(
                        dotDecoration: DotDecoration(
                          height: 10.h,
                          width: 10.w,
                          color:AppColors.colorpurple2,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        activeDotDecoration: DotDecoration(
                          height: 8.h,
                          width: 35.w,
                          color:AppColors.colorpurple,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onDotClicked: (index) {
                        if (_controller.isLast.value) {
                          _controller.pageController.previousPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.easeInToLinear);
                        } else {
                          _controller.pageController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.easeInToLinear);
                        }
                      },
                    ),
                  ),
                  SizedBox(width: 20.r),

                ],
              ),
              
              //زر تخطي
              InkWell(
                onTap: ()=>_controller.pageController.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.easeInToLinear),
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 30.r),
                  alignment: AlignmentDirectional.bottomCenter,
                  child: InkWell(
                      onTap: ()=>_controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.easeInToLinear),
                      child: SvgPicture.asset('${Const.images}next.svg',)),
                ),
              ),

//كلمة تخطي
              InkWell(
                onTap: () => _controller.goToLogin(),
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 5.r),
                  alignment: AlignmentDirectional.bottomCenter,
                  child: AppText.medium(text: 'skip',textAlign: TextAlign.center,textDecoration:TextDecoration.underline,
                  fontWeight: FontWeight.w600,fontSize: 18.r,color: AppColors.colorpurple)
                ),
              ),
            ],
          ),
        ),
      ],
    )),
  );
}














Widget pageViewScreens(Boardings boarding) => Container(
  width: double.infinity,
  color: boarding.bgColor,
  margin: EdgeInsets.only(top: 20.r),
  child: Column(
    children: [
      Align(
        alignment: AlignmentDirectional.topEnd,
        child: Container(
          margin: EdgeInsetsDirectional.only(top: 10.r, end: 0.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(16.r)
          ),
          child: Container(
            width: 180,
            height: 40.h,
            padding: EdgeInsetsDirectional.only(start: 8.r, end: 0.r),
            // decoration: BoxDecoration(
            //     color:Colors.white,
            //     borderRadius: BorderRadiusDirectional.circular(16.r),
            //   border: Border.all(
            //     color: AppColors.grayColorB
            //   )
            // ),
            margin: EdgeInsetsDirectional.only(
                top: 40.r, end: 28.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GetBuilder<LanguageController>(
                    builder: (controller) => DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        // isExpanded: true,
                        hint: AppText.medium(
                          text: AppHelper.getLangName(),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color:AppColors.colorpurple,
                        ),
                        items: controller.listLanguages
                            .map((lang) => DropdownMenuItem<Language>(
                          value: lang,
                          child: Text(
                            lang.languageName.tr,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              //لون النص الي داخل الدروب
                              color:Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                            .toList(),
                        onChanged: (value) {
                          controller.langSelected.value = value!.languageName;
                          print('LANG: ${value.languageCode}');
                          controller.saveLanguage(value.languageCode);
                          _controller.update();
                          controller.update();
                        },
                        icon: const Icon(
                          Icons.language,
                          size: 25,
                          color:AppColors.lightGray15,
                        ),
                        iconSize: 14.sp,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        buttonHeight: 40.h,
                        buttonWidth: 118.w,
                        buttonPadding:
                        const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              //حدود
                              color: AppColors.lightGray15,
                              width: 0.5,
                            ),
                            color:Colors.white),
                        itemHeight: 32.h,
                        dropdownMaxHeight: 80.h,
                        dropdownWidth: 100.w,
                        dropdownDecoration: const BoxDecoration(
                          // borderRadius: BorderRadius.circular(8),
                          //لون الدروب من جوا
                            color:Colors.white,
                        ),
                        dropdownElevation: 2,
                        scrollbarThickness: 6.r,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(10, 0),
                      ),
                    )),
                SizedBox(width: 0.w),
                // Icon(Icons.language),
                // SvgPicture.asset('${Const.icons}icon_language.svg',
                //     width: 20.w,
                //     height: 20.h,
                //     color: Colors.white),
              ],
            ),
          ),
        ),
      ),














      Container(
        height: 300,
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20.r)
        ),
        margin: EdgeInsetsDirectional.only(top: 40.r, start: 30.r, end: 28.r),
        child: Image.asset('${Const.images}${boarding.image}',
            fit: BoxFit.cover),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 0.0).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
  Container(
   margin: EdgeInsetsDirectional.only(top: 20),
  child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText.medium(
            fontWeight: FontWeight.w600,
            text: boarding.title,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            maxline: 3,
            color: Colors.black,),
        SizedBox(width: 5.w,),
        AppText.medium(
            fontWeight: FontWeight.w400,
            text: boarding.title,
            fontSize: 15.sp,
            textAlign: TextAlign.center,
            maxline: 3,
            color: AppColors.colorpurple),
      ],
    ),
  ),
            Container(
              margin: EdgeInsetsDirectional.only(top: 16.r),
              alignment: AlignmentDirectional.center,
              child: AppText.medium( text: boarding.details,color: AppColors.lightGray5,fontSize: 16.h),
            ),
          ],
        ),
      ),
    ],
  ),
);
}
// Widget pageViewScreens(Boardings boarding) => Container(
//   width: double.infinity,
//   color: boarding.bgColor,
//   margin: EdgeInsets.only(top: 20.r),
//   child: Column(
//     children: [
//       Align(
//         alignment: AlignmentDirectional.topEnd,
//         child: Container(
//           margin: EdgeInsetsDirectional.only(top: 10.r, end: 28.r),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadiusDirectional.circular(16.r)
//           ),
//           child: Container(
//             width: 150,
//             height: 40.h,
//             padding: EdgeInsetsDirectional.only(start: 8.r, end: 8.r),
//             decoration: BoxDecoration(
//                 color: AppColors.colorAppMain,
//                 borderRadius: BorderRadiusDirectional.circular(16.r)
//             ),
//             margin: EdgeInsetsDirectional.only(
//                 top: 40.r),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GetBuilder<LanguageController>(
//                     builder: (controller) => DropdownButtonHideUnderline(
//                       child: DropdownButton2(
//                         // isExpanded: true,
//                         hint: AppText.medium(
//                           text: AppHelper.getLangName(),
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.white,
//                         ),
//                         items: controller.listLanguages
//                             .map((lang) => DropdownMenuItem<Language>(
//                           value: lang,
//                           child: Text(
//                             lang.languageName.tr,
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.white,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ))
//                             .toList(),
//                         onChanged: (value) {
//                           controller.langSelected.value = value!.languageName;
//                           print('LANG: ${value.languageCode}');
//                           controller.saveLanguage(value.languageCode);
//                           _controller.update();
//                           controller.update();
//                         },
//                         icon: const Icon(
//                           Icons.arrow_drop_down,
//                           size: 32,
//                           color: Colors.white,
//                         ),
//                         iconSize: 14.sp,
//                         iconEnabledColor: Colors.white,
//                         iconDisabledColor: Colors.white,
//                         buttonHeight: 40.h,
//                         buttonWidth: 118.w,
//                         buttonPadding:
//                         const EdgeInsets.only(left: 14, right: 14),
//                         buttonDecoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.r),
//                             border: Border.all(
//                               color: AppColors.colorAppMain,
//                               width: 0.5,
//                             ),
//                             color: AppColors.colorAppMain),
//                         itemHeight: 32.h,
//                         dropdownMaxHeight: 80.h,
//                         dropdownWidth: 100.w,
//                         dropdownDecoration: const BoxDecoration(
//                           // borderRadius: BorderRadius.circular(8),
//                           color: AppColors.colorAppMain,
//                         ),
//                         dropdownElevation: 2,
//                         scrollbarThickness: 6.r,
//                         scrollbarAlwaysShow: true,
//                         offset: const Offset(10, 0),
//                       ),
//                     )),
//                 SizedBox(width: 0.w),
//                 SvgPicture.asset('${Const.icons}icon_language.svg',
//                     width: 20.w,
//                     height: 20.h,
//                     color: Colors.white),
//               ],
//             ),
//           ),
//         ),
//       ),
//       Container(
//         height: 300,
//         width: double.infinity,
//         clipBehavior: Clip.antiAlias,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadiusDirectional.circular(20.r)
//         ),
//         margin: EdgeInsetsDirectional.only(top: 80.r, start: 30.r, end: 28.r),
//         child: Image.asset('${Const.images}${boarding.image}',
//             fit: BoxFit.cover),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(top: 0.0).r,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r, top: 20),
//               child: AppText.medium(
//                   fontWeight: FontWeight.w400,
//                   text: boarding.title,
//                   fontSize: 18.sp,
//                   textAlign: TextAlign.center,
//                   maxline: 3,
//                   color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
// );
