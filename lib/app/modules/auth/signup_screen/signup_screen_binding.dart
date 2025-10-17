import 'package:get/get.dart';
import 'package:school_management/app/modules/auth/signup_screen/signup_screen_controller.dart';

class SignupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupScreenController>(() => SignupScreenController());
  }
}
