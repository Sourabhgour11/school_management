import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/utils/app_colours.dart';

class ProfileScreenController extends GetxController {
  // Profile Information
  var profileImage = ''.obs;
  var studentName = 'John Doe'.obs;
  var studentId = 'STU001'.obs;
  var studentClass = '10th Grade'.obs;
  var section = 'A'.obs;
  
  // Personal Information
  var email = 'john.doe@school.edu'.obs;
  var phone = '+1 (555) 123-4567'.obs;
  var address = '123 School Street, City, State 12345'.obs;
  var dateOfBirth = 'January 15, 2008'.obs;
  var parentName = 'Jane Doe'.obs;
  var parentPhone = '+1 (555) 987-6543'.obs;
  
  // Academic Information
  var academicYear = '2024-2025'.obs;
  var classTeacher = 'Ms. Sarah Johnson'.obs;
  var rollNumber = '10A001'.obs;
  var admissionDate = 'August 15, 2020'.obs;
  var bloodGroup = 'O+'.obs;
  
  // Quick Stats
  var attendancePercentage = 85.obs;
  var gpa = '3.8'.obs;
  var completedAssignments = 24.obs;
  var examsTaken = 8.obs;

  @override
  void onInit() {
    super.onInit();
    _loadProfileData();
  }

  void _loadProfileData() {
    // Mock profile data - replace with actual API call
    // This would typically load from shared preferences or API
  }

  void changeProfilePicture() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Change Profile Picture'),
        content: const Text('How would you like to update your profile picture?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              _takePhoto();
            },
            child: const Text('Take Photo'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              _chooseFromGallery();
            },
            child: const Text('Choose from Gallery'),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _takePhoto() {
    Get.snackbar(
      'Camera',
      'Opening camera to take photo...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Implement camera functionality
  }

  void _chooseFromGallery() {
    Get.snackbar(
      'Gallery',
      'Opening gallery to choose photo...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Implement gallery functionality
  }

  void editProfile() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Edit Profile'),
        content: const Text('Profile editing functionality will be implemented soon.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
    // Navigate to edit profile screen
  }

  void openSettings() {
    Get.snackbar(
      'Settings',
      'Opening settings...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to settings screen
  }

  void openNotifications() {
    Get.snackbar(
      'Notifications',
      'Opening notification settings...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to notification settings screen
  }

  void openHelp() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Help & Support'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Need help? Contact us:'),
            const SizedBox(height: 16),
            _buildHelpOption(Icons.email, 'Email Support', 'support@school.edu'),
            _buildHelpOption(Icons.phone, 'Phone Support', '+1 (555) 123-4567'),
            _buildHelpOption(Icons.location_on, 'Visit Office', 'Room 101, Main Building'),
            const SizedBox(height: 16),
            const Text(
              'Office Hours: Monday - Friday, 8:00 AM - 5:00 PM',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpOption(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColours.appColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  value,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🔴 Logout Icon
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const SizedBox(height: 20),

              // 🔤 Title
              const Text(
                "Logout",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // 💬 Subtitle
              const Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),

              const SizedBox(height: 25),

              // 🧭 Buttons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Confirm Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        Get.offAllNamed('/login');
                        // logoutUser();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false, // user must choose
    );
  }

  void _performLogout() {
    Get.snackbar(
      'Logout',
      'Logging out...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
    );
    
    // Clear user data and navigate to login
    // Get.offAllNamed('/login');
  }

  void refreshProfile() {
    _loadProfileData();
    Get.snackbar(
      'Refreshed',
      'Profile data updated',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
  }

  void shareProfile() {
    Get.snackbar(
      'Share',
      'Sharing profile...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Implement share functionality
  }

  void exportProfile() {
    Get.snackbar(
      'Export',
      'Exporting profile data...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Implement export functionality
  }
}
