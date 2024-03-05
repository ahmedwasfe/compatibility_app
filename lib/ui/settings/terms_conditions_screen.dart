import 'package:compatibility_app/utils/app_color.dart';
import 'package:compatibility_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_text.dart';
//شروط الاحكام
class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppText.medium(
            text: 'terms_conditions',
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  '${Const.images}notfiactions.svg',
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 16.r,end: 16.r,top: 10.r,bottom: 20.r),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.colorGray,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.medium(text: 'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى\n المقروء لصفحة ما سيلهي القارئ عن التركيز على\n الشكل الخارجي للنص أو شكل توضع الفقرات في \nالصفحة التي يقرأها. ولذلك يتم استخدام طريقة\n لوريم إيبسوم لأنها تعطي توزيعاَ طبيعياَ -إلى\n حد ما- للأحرف عوضاً عن استخدام "هنا يوجد محتوى\n نصي، هنا يوجد محتوى نصي" فتجعلها تبدو \n(أي الأحرف) وكأنها نص مقروء. العديد من برامح \nالنشر المكتبي وبرامح تحرير صفحات الويب\n تستخدم لوريم إيبسوم بشكل إفتراضي',
                color: AppColors.lightGray3,fontSize: 14.h),
              ],
            ),
          ),
          ],
      ),
    );
  }
}
