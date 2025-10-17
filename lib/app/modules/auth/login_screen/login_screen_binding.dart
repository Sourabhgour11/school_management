import 'package:get/get.dart';
import 'package:school_management/app/modules/auth/login_screen/login_screen_controller.dart';

class LoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(() => LoginScreenController());
  }
}
