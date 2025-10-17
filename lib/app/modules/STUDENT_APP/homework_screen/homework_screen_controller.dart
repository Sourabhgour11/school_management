import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/utils/app_colours.dart';

class HomeworkScreenController extends GetxController {
  // Filter state
  var selectedFilter = 'all'.obs;
  
  // Counts
  var pendingCount = 0.obs;
  var completedCount = 0.obs;
  
  // Homework list
  var homeworkList = <Map<String, dynamic>>[].obs;
  var filteredHomework = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadHomework();
  }

  void _loadHomework() {
    // Mock homework data
    homeworkList.value = [
      {
        'id': 1,
        'title': 'Quadratic Equations Practice',
        'description': 'Solve the given quadratic equations and show your working. Submit your solutions with proper steps.',
        'subject': 'Mathematics',
        'teacher': 'Mr. Smith',
        'dueDate': 'Dec 22, 2024',
        'isCompleted': false,
        'isOverdue': false,
        'attachments': 2,
        'priority': 'high',
        'points': 25,
      },
      {
        'id': 2,
        'title': 'Photosynthesis Lab Report',
        'description': 'Write a detailed lab report on the photosynthesis experiment conducted in class. Include observations, analysis, and conclusions.',
        'subject': 'Science',
        'teacher': 'Ms. Johnson',
        'dueDate': 'Dec 21, 2024',
        'isCompleted': true,
        'isOverdue': false,
        'attachments': 1,
        'priority': 'medium',
        'points': 30,
      },
      {
        'id': 3,
        'title': 'Shakespeare Essay',
        'description': 'Analyze the theme of love in Romeo and Juliet. Write a 500-word essay with proper citations.',
        'subject': 'English',
        'teacher': 'Mr. Brown',
        'dueDate': 'Dec 20, 2024',
        'isCompleted': false,
        'isOverdue': true,
        'attachments': 0,
        'priority': 'high',
        'points': 40,
      },
      {
        'id': 4,
        'title': 'World War II Timeline',
        'description': 'Create a comprehensive timeline of major events during World War II. Include dates, key figures, and outcomes.',
        'subject': 'History',
        'teacher': 'Ms. Davis',
        'dueDate': 'Dec 25, 2024',
        'isCompleted': false,
        'isOverdue': false,
        'attachments': 3,
        'priority': 'medium',
        'points': 35,
      },
      {
        'id': 5,
        'title': 'Geography Map Project',
        'description': 'Draw and label a world map showing all continents, major countries, and important geographical features.',
        'subject': 'Geography',
        'teacher': 'Mr. Wilson',
        'dueDate': 'Dec 23, 2024',
        'isCompleted': true,
        'isOverdue': false,
        'attachments': 1,
        'priority': 'low',
        'points': 20,
      },
      {
        'id': 6,
        'title': 'Chemistry Problem Set',
        'description': 'Complete the chemical equations and balance them. Show all calculations and explain the chemical processes.',
        'subject': 'Chemistry',
        'teacher': 'Dr. Miller',
        'dueDate': 'Dec 24, 2024',
        'isCompleted': false,
        'isOverdue': false,
        'attachments': 1,
        'priority': 'high',
        'points': 30,
      },
    ];
    
    _updateCounts();
    _filterHomework();
  }

  void _updateCounts() {
    pendingCount.value = homeworkList.where((hw) => !hw['isCompleted']).length;
    completedCount.value = homeworkList.where((hw) => hw['isCompleted']).length;
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
    _filterHomework();
  }

  void _filterHomework() {
    switch (selectedFilter.value) {
      case 'pending':
        filteredHomework.value = homeworkList.where((hw) => !hw['isCompleted']).toList();
        break;
      case 'completed':
        filteredHomework.value = homeworkList.where((hw) => hw['isCompleted']).toList();
        break;
      default:
        filteredHomework.value = homeworkList;
    }
  }

  void viewDetails(Map<String, dynamic> homework) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(Icons.assignment, color: AppColours.appColor),
            const SizedBox(width: 8),
            Expanded(child: Text(homework['title'])),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow('Subject', homework['subject']),
              _buildDetailRow('Teacher', homework['teacher']),
              _buildDetailRow('Due Date', homework['dueDate']),
              _buildDetailRow('Points', '${homework['points']} points'),
              _buildDetailRow('Priority', homework['priority'].toUpperCase()),
              const SizedBox(height: 12),
              const Text(
                'Description:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(homework['description']),
              if (homework['attachments'] > 0) ...[
                const SizedBox(height: 12),
                const Text(
                  'Attachments:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text('${homework['attachments']} file(s) attached'),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Close'),
          ),
          if (!homework['isCompleted'])
            ElevatedButton(
              onPressed: () {
                Get.back();
                submitHomework(homework);
              },
              child: const Text('Submit'),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void submitHomework(Map<String, dynamic> homework) {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Submit Homework'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('How would you like to submit your homework?'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                      _uploadFile(homework);
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Upload File'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.appColor,
                      foregroundColor: AppColours.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Get.back();
                      _writeOnline(homework);
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Write Online'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColours.appColor,
                      side: BorderSide(color: AppColours.appColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _uploadFile(Map<String, dynamic> homework) {
    Get.snackbar(
      'Upload',
      'Opening file upload for ${homework['title']}',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Implement file upload functionality
  }

  void _writeOnline(Map<String, dynamic> homework) {
    Get.snackbar(
      'Online Editor',
      'Opening online editor for ${homework['title']}',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Implement online editor functionality
  }

  void markAsCompleted(Map<String, dynamic> homework) {
    homework['isCompleted'] = true;
    _updateCounts();
    _filterHomework();
    Get.snackbar(
      'Completed',
      'Homework marked as completed',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  void refreshHomework() {
    _loadHomework();
    Get.snackbar(
      'Refreshed',
      'Homework list updated',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  void sortByDueDate() {
    filteredHomework.sort((a, b) {
      // Simple date comparison (in real app, parse actual dates)
      return a['dueDate'].compareTo(b['dueDate']);
    });
    Get.snackbar(
      'Sorted',
      'Homework sorted by due date',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  void sortByPriority() {
    final priorityOrder = {'high': 1, 'medium': 2, 'low': 3};
    filteredHomework.sort((a, b) {
      return priorityOrder[a['priority']]!.compareTo(priorityOrder[b['priority']]!);
    });
    Get.snackbar(
      'Sorted',
      'Homework sorted by priority',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.purple.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
}
