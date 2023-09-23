import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/app_text.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class UserTypeScreen extends StatelessWidget {
  const UserTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(top: 105.r),
            alignment: AlignmentDirectional.center,
            child: AppText.larg(text: 'welcome_to_application',
                color:Colors.black, ),
          ),


          Container(
            padding: EdgeInsetsDirectional.only(top: 6.r),
            alignment: AlignmentDirectional.center,
            child: AppText.medium(text: 'welcome_to_tawafuq_application',
              color:AppColors.darkSecondColor),
          ),


          Container(
            padding: EdgeInsetsDirectional.only(top: 36.r),
            alignment: AlignmentDirectional.center,
            child: SvgPicture.asset('${Const.images}user_type.svg',
            fit: BoxFit.cover,
            height: 186.h,
            width: double.infinity,),
          ),


        ],
      ),
    );
  }
}
