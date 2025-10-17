import 'package:get/get.dart';
import 'package:school_management/app/modules/STUDENT_APP/bottomnav_screen/student_bottomnav_screen.dart';
import 'package:school_management/app/modules/STUDENT_APP/bottomnav_screen/student_bottomnav_screen_binding.dart';
import 'package:school_management/app/modules/auth/login_screen/login_screen.dart';
import 'package:school_management/app/modules/auth/login_screen/login_screen_binding.dart';
import 'package:school_management/app/modules/auth/otp_screen/otp_screen.dart';
import 'package:school_management/app/modules/auth/otp_screen/otp_screen_binding.dart';
import 'package:school_management/app/modules/auth/signup_screen/signup_screen.dart';
import 'package:school_management/app/modules/auth/signup_screen/signup_screen_binding.dart';
import 'package:school_management/app/modules/auth/forgot_password_screen/forgot_password_screen.dart';
import 'package:school_management/app/modules/auth/forgot_password_screen/forgot_password_screen_binding.dart';
import '../modules/splash_screen/splash_screen.dart';
import '../modules/splash_screen/splash_screen_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.studentBottomNavScreen,
      page: () => StudentBottomnavScreen(),
      binding: StudentBottomnavScreenBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignupScreen(),
      binding: SignupScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPasswordScreen(),
      binding: ForgotPasswordScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      page: () => OtpScreenScreen(),
      binding: OtpScreenBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.forgotOtp,
    //   page: () => ForgotOtpScreen(),
    //   binding: ForgotOtpScreenBinding(),
    // ),
    //
    // GetPage(
    //   name: AppRoutes.cleanerHome,
    //   page: () => CleanerHomeScreen(),
    //   binding: CleanerHomeScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.booking,
    //   page: () => BookingScreen(),
    //   binding: BookingBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.userBookingScreen,
    //   page: () => UserBookingScreen(),
    //   binding: UserBookingScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.inbox,
    //   page: () => InboxScreen(),
    //   binding: InboxScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.editProfile,
    //   page: () => EditProfileScreen(),
    //   binding: EditProfileScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.incentive,
    //   page: () => IncentiveScreen(),
    //   binding: IncentiveScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.helpAndSupport,
    //   page: () => HelpAndSupportScreen(),
    //   binding: HelpAndSupportScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.getContent,
    //   page: () => GetContentScreen(),
    //   binding: GetContentBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.deleteAccount,
    //   page: () => DeleteScreen(),
    //   binding: DeleteScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.signUp,
    //   page: () => SignUpScreen(),
    //   binding: SignUpScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.otp,
    //   page: () => OtpScreenScreen(),
    //   binding: OtpScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.forgotPassword,
    //   page: () => ForgotPasswordScreen(),
    //   binding: ForgotPasswordScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.forgotOtp,
    //   page: () => ForgotOtpScreen(),
    //   binding: ForgotOtpScreenBinding(),
    // ),
    //
    // GetPage(
    //   name: AppRoutes.cleanerbottomNav,
    //   page: () => CleanerBottomNavScreen(),
    //   binding: CleanerBottomNavBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.subCategory,
    //   page: () => SubCategoriesScreen(),
    //   binding: SubCategoriesScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.bookServiceStep1,
    //   page: () => BookServiceStep1Screen(),
    //   binding: BookServiceStep1ScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.bookServiceStep2,
    //   page: () => BookServiceStep2Screen(),
    //   binding: BookServiceStep2ScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.bookServiceStep3,
    //   page: () => BookServiceStep3Screen(),
    //   binding: BookServiceStep3ScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.bookServiceStep4,
    //   page: () => BookServiceStep4Screen(),
    //   binding: BookServiceStep4ScreenBinding(),
    // ),
    //
    // GetPage(
    //   name: AppRoutes.cleanerHome,
    //   page: () => CleanerHomeScreen(),
    //   binding: CleanerHomeScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.booking,
    //   page: () => BookingScreen(),
    //   binding: BookingBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.inbox,
    //   page: () => InboxScreen(),
    //   binding: InboxScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.userBottomNav,
    //   page: () => UserBottomNavScreen(),
    //   binding: UserBottomNavBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.partnerbottomNav,
    //   page: () => PartnerBottomNavScreen(),
    //   binding: PartnerBottomNavBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.favourite,
    //   page: () => FavouritesScreen(),
    //   binding: FavouritesScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.deleteAccount,
    //   page: () => DeleteScreen(),
    //   binding: DeleteScreenBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.bookingDetails,
    //   page: () => BookingDetailsScreen(),
    //   binding: BookingDetailsScreenBinding(),
    // ),
  ];
}
