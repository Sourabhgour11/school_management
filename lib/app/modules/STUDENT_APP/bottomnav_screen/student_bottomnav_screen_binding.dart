import 'package:get/get.dart';
import 'package:school_management/app/modules/STUDENT_APP/bottomnav_screen/student_bottomnav_screen_controller.dart';

class StudentBottomnavScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentBottomnavScreenController());
  }
}
