import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppWidgets{


  static Widget CustomButton({
    required String text,
    required Function() click,
    double width = double.infinity,
    double height = 47.0,
    Color background = AppColors.colorpurple,
    bool isUpperCase = true,
    Color textColor = Colors.white,
    double fontSize = 18.0,
    String fontfamily = Const.appFont,
    FontWeight fontWeight = FontWeight.w600,
    double radius = 0.0,
    double marginLeft = 0.0,
    Color borderColor = AppColors.colorpurple,
    double borderWidth = 1.5,
  }) =>
      Container(
        margin: EdgeInsets.only(left: marginLeft),
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: background,
            border: Border.all(color: borderColor, width: borderWidth)),
        child: MaterialButton(
          onPressed: click,
          child: Text(
            isUpperCase ? text.toUpperCase().tr : text.tr,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontFamily: fontfamily,
                fontWeight: fontWeight),
          ),
        ),
      );

  static Widget CustomAnimationProgress() => Center(
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          width: 40.w,
          height: 40.h,
          child: LoadingAnimationWidget.threeArchedCircle(
              color: AppColors.colorpurple,
              size: 25.h)));

  static showSnackBar(
      {required BuildContext context,
        required String message,
        Color textColor = Colors.white,
        Color backgroundColor = AppColors.colorSnackBaErrorColor,
        Color iconColor = AppColors.colorSnackBaErrorColor,
        Widget? startIcon,
        Color startIconColor = AppColors.colorErrorText}) {
    awesomeTopSnackbar(
      context,
      message.tr,
      textStyle: TextStyle(
          color: textColor,
          fontFamily: Const.appFont,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp),
      backgroundColor: backgroundColor,
      starIcon:
      startIcon ?? Icon(Icons.error_outline_rounded, color: startIconColor),
      icon: Icon(Icons.close, color: iconColor),
      iconWithDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: backgroundColor),
      ),
    );
  }
}



class MainToolBar extends StatelessWidget {
  String? title;
  String? route = '';
  bool? isBack = false;

  MainToolBar({required this.title, this.route, this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.colorGray,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        child: Row(
          children: [
            SizedBox(width: 20),
            isBack!
                ? InkWell(
                child: SvgPicture.asset('assets/icons/back.svg'),
                onTap: () => Get.offAndToNamed(route!))
                : Container(),
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                '$title'.tr,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: Const.appFont),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TextAbout extends StatelessWidget {
  const TextAbout({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Text(title.tr, style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: const Color(0xff000000),
          fontFamily: Const.appFont
      ),),
    );
  }


}