import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  // Student Information
  var studentName = 'John Doe'.obs;
  var studentClass = '10th Grade'.obs;
  var rollNumber = 'STU001'.obs;
  
  // Quick Stats
  var attendancePercentage = 85.obs;
  var pendingAssignments = 3.obs;
  var upcomingExams = 2.obs;
  
  // Today's Schedule
  var todaysSchedule = <Map<String, dynamic>>[].obs;
  
  // Recent Activities
  var recentActivities = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadTodaysSchedule();
    _loadRecentActivities();
  }

  void _loadTodaysSchedule() {
    // Mock data - replace with actual API call
    todaysSchedule.value = [
      {
        'subject': 'Mathematics',
        'time': '9:00 AM - 10:00 AM',
        'room': 'Room 101',
        'teacher': 'Mr. Smith',
      },
      {
        'subject': 'Science',
        'time': '10:15 AM - 11:15 AM',
        'room': 'Room 102',
        'teacher': 'Ms. Johnson',
      },
      {
        'subject': 'English',
        'time': '11:30 AM - 12:30 PM',
        'room': 'Room 103',
        'teacher': 'Mr. Brown',
      },
    ];
  }

  void _loadRecentActivities() {
    // Mock data - replace with actual API call
    recentActivities.value = [
      {
        'title': 'Assignment Submitted',
        'description': 'Math homework completed',
        'time': '2 hours ago',
        'icon': Icons.assignment_turned_in,
        'color': Colors.green,
      },
      {
        'title': 'Grade Updated',
        'description': 'Science test result published',
        'time': '1 day ago',
        'icon': Icons.grade,
        'color': Colors.blue,
      },
      {
        'title': 'Attendance Marked',
        'description': 'Present in all classes',
        'time': '2 days ago',
        'icon': Icons.event_available,
        'color': Colors.orange,
      },
      {
        'title': 'New Assignment',
        'description': 'English essay assigned',
        'time': '3 days ago',
        'icon': Icons.assignment,
        'color': Colors.purple,
      },
    ];
  }

  // Quick Actions
  void viewGrades() {
    Get.snackbar(
      'Grades',
      'Opening grades section...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to grades screen
  }

  void submitAssignment() {
    Get.snackbar(
      'Assignment',
      'Opening assignment submission...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to assignment submission screen
  }

  void downloadNotes() {
    Get.snackbar(
      'Notes',
      'Opening notes download...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to notes download screen
  }

  void contactTeacher() {
    Get.snackbar(
      'Contact',
      'Opening teacher contact...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.purple.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to teacher contact screen
  }

  // Refresh data
  void refreshData() {
    _loadTodaysSchedule();
    _loadRecentActivities();
    Get.snackbar(
      'Refreshed',
      'Data updated successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
}
