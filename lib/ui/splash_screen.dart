import 'package:compatibility_app/utils/app_helper.dart';
import 'package:compatibility_app/utils/components.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppHelper.statusBarColor(isHome: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: EdgeInsetsDirectional.only(top: 100.r),
              child: SvgPicture.asset('${Const.images}logo_com.svg',fit: BoxFit.cover,height: 100,width: double.infinity,)),
          SizedBox(height: 50),
          AppWidgets.CustomAnimationProgress(),
        ],
      )
    );
  }
}

