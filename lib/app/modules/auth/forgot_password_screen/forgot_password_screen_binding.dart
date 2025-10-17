import 'package:get/get.dart';
import 'package:school_management/app/modules/auth/forgot_password_screen/forgot_password_screen_controller.dart';

class ForgotPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordScreenController>(() => ForgotPasswordScreenController());
  }
}
