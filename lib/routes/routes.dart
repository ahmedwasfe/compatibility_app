
import 'package:compatibility_app/bindings/login_bindings.dart';
import 'package:compatibility_app/bindings/register_bindings.dart';
import 'package:compatibility_app/ui/auth/register/forget_password_screen.dart';
import 'package:compatibility_app/ui/auth/login_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_appearance_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_conditions_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_debt_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_information_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_nationality_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_password_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_self_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_status_screen.dart';
import 'package:compatibility_app/ui/auth/register/register_education_screen.dart';
import 'package:compatibility_app/ui/auth/register/wifes_specifications_screen.dart';
import 'package:compatibility_app/ui/boarding_screen.dart';
import 'package:compatibility_app/ui/home/home_screen.dart';
import 'package:compatibility_app/ui/home/pages/members_screen.dart';
import 'package:compatibility_app/ui/members/profile_members_screen.dart';
import 'package:compatibility_app/ui/settings/Ignore_list.dart';
import 'package:compatibility_app/ui/settings/about_us_Screen.dart';
import 'package:compatibility_app/ui/settings/call_screen.dart';
import 'package:compatibility_app/ui/settings/compatibility_card_screen.dart';
import 'package:compatibility_app/ui/settings/list_interest_screen.dart';
import 'package:compatibility_app/ui/settings/notifications_screen.dart';
import 'package:compatibility_app/ui/settings/report_problem_screen.dart';
import 'package:compatibility_app/ui/settings/secret_politics_screen.dart';
import 'package:compatibility_app/ui/settings/settings_screen.dart';
import 'package:compatibility_app/ui/settings/success_stories_screen.dart';
import 'package:compatibility_app/ui/settings/tawafuq_blog_screen.dart';
import 'package:compatibility_app/ui/settings/tawafuq_details_screen.dart';
import 'package:compatibility_app/ui/settings/terms_conditions_screen.dart';
import 'package:compatibility_app/ui/splash_screen.dart';
import 'package:compatibility_app/ui/user_type_screen.dart';
import 'package:compatibility_app/ui/welcome_screen.dart';
import 'package:get/get.dart';

import '../ui/auth/check _email_screen.dart';
import '../ui/settings/profial_screen.dart';
class AppRoutes {


  static final routesPages = [


    GetPage(name: Routes.splash, page: () => SplashScreen()),
    GetPage(name: Routes.boarding, page: () => BoardingScreen()),
    GetPage(name: Routes.welcom, page: () => WelcomScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen(), binding: LoginBinging()),
    GetPage(name: Routes.register, page: () => RegisterScreen(), binding: RegisterBinging()),
    GetPage(name: Routes.forget, page: () => ForgetPasswordScreen()),
    GetPage(name: Routes.user_type, page: () => UserTypeScreen()),
    GetPage(name: Routes.register_password, page: () => RegisterPasswordScreen()),
    GetPage(name: Routes.register_nationality, page: () => RegisterNationalityScreen()),
    GetPage(name: Routes.register_status, page: () => RegisterStatusScreen()),
    GetPage(name: Routes.register_appearance, page: () => RegisterAppearanceScreen()),
    GetPage(name: Routes.register_debt, page: () => RegisterDebtScreen()),
    GetPage(name: Routes.register_Study, page: () => RegisterEducationScreen()),
    GetPage(name: Routes.register_Wifes, page: () => WifesSpecificationScreen()),
    GetPage(name: Routes.register_self, page: () => RegisterSelfScreen()),
    GetPage(name: Routes.register_Informations, page: () => RegisterInformationsScreen()),
    GetPage(name: Routes.register_conditions, page: () => RegisterConditionsScreen()),
    GetPage(name: Routes.check_email, page: () => CheckEmailScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.settings, page: () => SettingsScreen()),
    GetPage(name: Routes.list_interest, page: () => ListInterestScreen()),
    GetPage(name: Routes.list_lgnore, page: () => LgnoreList()),
    GetPage(name: Routes.notifications, page: () => NotificationsScreen()),
    GetPage(name: Routes.compatibiltity_card, page: () => CompatibiltityCardScreen()),
    GetPage(name: Routes.tawafuq_blog, page: () => TawafuqBlogScreen()),
    GetPage(name: Routes.tawafuq_details, page: () => TawafuqDetailsScreen()),
    GetPage(name: Routes.secretPolitics, page: () => secretPoliticsScreen()),
    GetPage(name: Routes.about, page: () => AboutUsScreen()),
    GetPage(name: Routes.call, page: () => CallScreen()),
    GetPage(name: Routes.report_problem, page: () => ReportProblemScreen()),
    GetPage(name: Routes.members, page: () => MembersScreen()),
    GetPage(name: Routes.success_stories, page: () => SuccessStoriesScreen()),
    GetPage(name: Routes.profial, page: () => ProfialScreen()),
    GetPage(name: Routes.profial_members, page: () => ProfialMembersScreen()),

  ];

}


class Routes {
  static const splash = '/splash' ;
  static const boarding = '/boarding';
  static const welcom = '/WelcomScreen';
  static const login = '/LoginScreen' ;
  static const register = '/RegisterScreen' ;
  static const user_type = '/UserTypeScreen' ;
  static const forget = '/ForgetPasswordScreen' ;
  static const register_password = '/RegisterPasswordScreen' ;
  static const register_nationality = '/RegisterNationalityScreen' ;
  static const register_status = '/RegisterStatusScreen' ;
  static const register_appearance = '/RegisterAppearanceScreen' ;
  static const register_debt = '/RegisterDebtScreen' ;
  static const register_Study = '/RegisterStudyScreen' ;
  static const register_Wifes = '/WifesSpecificationScreen' ;
  static const register_self = '/RegisterSelfScreen' ;
  static const register_Informations = '/RegisterInformationsScreen' ;
  static const register_conditions = '/register_conditions' ;
  static const check_email = '/CheckEmailScreen' ;
  static const home = '/HomeScreen' ;
  static const settings = '/SettingsScreen' ;
  static const list_interest = '/ListInterestScreen' ;
  static const list_lgnore = '/LgnoreList' ;
  static const notifications = '/NotificationsScreen' ;
  static const compatibiltity_card = '/CompatibiltityCardScreen' ;
  static const tawafuq_blog = '/TawafuqBlogScreen' ;
  static const tawafuq_details = '/TawafuqDetailsScreen' ;
  static const secretPolitics = '/secretPoliticsScreen' ;
  static const about = '/AboutUsScreen' ;
  static const call = '/CallScreen' ;
  static const report_problem = '/ReportProblemScreen' ;
  static const members = '/MembersScreen' ;
  static const success_stories = '/SuccessStoriesScreen' ;
  static const profial = '/ProfialScreen' ;
  static const profial_members = '/ProfialMembersScreen' ;


}