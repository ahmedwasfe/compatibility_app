import 'dart:developer';
import 'dart:io';

import 'package:compatibility_app/api/firebase_api.dart';
import 'package:compatibility_app/bindings/app_bindings.dart';
import 'package:compatibility_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'routes/routes.dart';
import 'utils/app_helper.dart';
import 'utils/local.dart';
import 'utils/preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await _initFirebase();
  await FirebaseAPIs().getFCMToken();
  // await AppHelper.saveDeviceInfo();
  // log('Platform: ${Platform.isAndroid ? TargetPlatform.android.name : TargetPlatform.iOS.name}');
  runApp(const MyApp());
}

_initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

Future initServices() async {
  await Get.putAsync(() => PreferencesManager().initial());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, widget) =>
          GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: AppHelper.getAppLocale(),
        translations: AppTranslations(),
        initialBinding: AppBindings(),
        initialRoute: Routes.splash,
        getPages: AppRoutes.routesPages,
      ),
    );


  }
}

