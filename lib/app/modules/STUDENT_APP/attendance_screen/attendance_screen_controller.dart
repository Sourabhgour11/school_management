import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttendanceScreenController extends GetxController {
  // Overall attendance data
  var overallAttendance = 85.obs;
  var presentDays = 17.obs;
  var absentDays = 3.obs;
  var lateDays = 2.obs;
  var lastUpdated = "Today".obs;
  var currentMonth = "December 2024".obs;

  // Calendar data
  var calendarDays = <Map<String, dynamic>>[].obs;

  // Subject-wise attendance
  var subjectAttendance = <Map<String, dynamic>>[].obs;

  // Recent records
  var recentRecords = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadCalendarData();
    _loadSubjectAttendance();
    _loadRecentRecords();
  }

  void _loadCalendarData() {
    // Mock calendar data for current month
    calendarDays.value = [
      // Previous month days (grayed out)
      {'day': 25, 'status': '', 'isCurrentMonth': false, 'isToday': false},
      {'day': 26, 'status': '', 'isCurrentMonth': false, 'isToday': false},
      {'day': 27, 'status': '', 'isCurrentMonth': false, 'isToday': false},
      {'day': 28, 'status': '', 'isCurrentMonth': false, 'isToday': false},
      {'day': 29, 'status': '', 'isCurrentMonth': false, 'isToday': false},
      {'day': 30, 'status': '', 'isCurrentMonth': false, 'isToday': false},
      {'day': 1, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 2, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 3, 'status': 'absent', 'isCurrentMonth': true, 'isToday': false},
      {'day': 4, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 5, 'status': 'late', 'isCurrentMonth': true, 'isToday': false},
      {'day': 6, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 7, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 8, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 9, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 10, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 11, 'status': 'absent', 'isCurrentMonth': true, 'isToday': false},
      {'day': 12, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 13, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 14, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 15, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 16, 'status': 'late', 'isCurrentMonth': true, 'isToday': false},
      {'day': 17, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 18, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 19, 'status': 'present', 'isCurrentMonth': true, 'isToday': false},
      {'day': 20, 'status': 'present', 'isCurrentMonth': true, 'isToday': true}, // Today
      {'day': 21, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 22, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 23, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 24, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 25, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 26, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 27, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 28, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 29, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 30, 'status': '', 'isCurrentMonth': true, 'isToday': false},
      {'day': 31, 'status': '', 'isCurrentMonth': true, 'isToday': false},
    ];
  }

  void _loadSubjectAttendance() {
    // Mock subject-wise attendance data
    subjectAttendance.value = [
      {
        'name': 'Mathematics',
        'present': 18,
        'total': 20,
        'percentage': 90,
      },
      {
        'name': 'Science',
        'present': 16,
        'total': 20,
        'percentage': 80,
      },
      {
        'name': 'English',
        'present': 19,
        'total': 20,
        'percentage': 95,
      },
      {
        'name': 'History',
        'present': 15,
        'total': 20,
        'percentage': 75,
      },
      {
        'name': 'Geography',
        'present': 17,
        'total': 20,
        'percentage': 85,
      },
    ];
  }

  void _loadRecentRecords() {
    // Mock recent attendance records
    recentRecords.value = [
      {
        'subject': 'Mathematics',
        'date': 'Dec 20, 2024',
        'time': '9:00 AM',
        'status': 'present',
      },
      {
        'subject': 'Science',
        'date': 'Dec 20, 2024',
        'time': '10:15 AM',
        'status': 'present',
      },
      {
        'subject': 'English',
        'date': 'Dec 20, 2024',
        'time': '11:30 AM',
        'status': 'present',
      },
      {
        'subject': 'History',
        'date': 'Dec 19, 2024',
        'time': '2:00 PM',
        'status': 'late',
      },
      {
        'subject': 'Geography',
        'date': 'Dec 19, 2024',
        'time': '3:15 PM',
        'status': 'present',
      },
      {
        'subject': 'Mathematics',
        'date': 'Dec 18, 2024',
        'time': '9:00 AM',
        'status': 'absent',
      },
    ];
  }

  // Refresh attendance data
  void refreshAttendance() {
    _loadCalendarData();
    _loadSubjectAttendance();
    _loadRecentRecords();
    Get.snackbar(
      'Refreshed',
      'Attendance data updated successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  // Export attendance report
  void exportReport() {
    Get.snackbar(
      'Export',
      'Generating attendance report...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Implement export functionality
  }

  // View detailed attendance
  void viewDetailedAttendance(String subject) {
    Get.snackbar(
      'Details',
      'Opening detailed attendance for $subject',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to detailed attendance screen
  }
}
