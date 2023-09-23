
import 'package:compatibility_app/bindings/app_bindings.dart';
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
  runApp(const MyApp());
}

Future initServices() async {
  await Get.putAsync(() => PreferencesManager().initial());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, widget) => GetMaterialApp(
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

