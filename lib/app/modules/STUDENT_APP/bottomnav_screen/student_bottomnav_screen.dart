import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/modules/STUDENT_APP/bottomnav_screen/student_bottomnav_screen_controller.dart';
import 'package:school_management/app/modules/STUDENT_APP/home_screen/home_screen.dart';
import 'package:school_management/app/modules/STUDENT_APP/attendance_screen/attendance_screen.dart';
import 'package:school_management/app/modules/STUDENT_APP/homework_screen/homework_screen.dart';
import 'package:school_management/app/modules/STUDENT_APP/profile_screen/profile_screen.dart';
import 'package:school_management/app/utils/app_colours.dart';

class StudentBottomnavScreen extends StatelessWidget {
  StudentBottomnavScreen({super.key});

  final StudentBottomnavScreenController controller = Get.put(StudentBottomnavScreenController());

  final List<Widget> pages = [
    HomeScreen(),
    AttendanceScreen(),
    HomeworkScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTab,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColours.appColor,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note_outlined),
                activeIcon: Icon(Icons.event_note),
                label: 'Attendance',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                activeIcon: Icon(Icons.book),
                label: 'Homework',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
