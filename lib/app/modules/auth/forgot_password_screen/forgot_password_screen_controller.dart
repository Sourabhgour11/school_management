import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreenController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();
  
  // Text controllers
  final emailController = TextEditingController();
  
  // Observable variables
  var isLoading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Send reset link function
  Future<void> sendResetLink() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;
      
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock reset link logic - replace with actual API call
      if (emailController.text.isNotEmpty) {
        // Show success message
        Get.snackbar(
          'Success',
          'Password reset link sent to ${emailController.text}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        
        // Show additional instructions
        await Future.delayed(const Duration(seconds: 1));
        _showResetInstructions();
      } else {
        throw Exception('Invalid email');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to send reset link. Please try again.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Show reset instructions dialog
  void _showResetInstructions() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(Icons.mark_email_read, color: Colors.green[600]),
            const SizedBox(width: 8),
            const Text('Check Your Email'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We\'ve sent password reset instructions to:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                emailController.text,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please follow these steps:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('1. Check your email inbox'),
            const Text('2. Look for an email from School Management'),
            const Text('3. Click the reset link in the email'),
            const Text('4. Follow the instructions to create a new password'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.orange[600], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Didn\'t receive the email? Check your spam folder or try again.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              Get.back(); // Go back to login screen
            },
            child: const Text('Back to Login'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // Optionally resend email
              sendResetLink();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.white,
            ),
            child: const Text('Resend Email'),
          ),
        ],
      ),
    );
  }

  // Contact support function
  void contactSupport() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Row(
          children: [
            Icon(Icons.support_agent, color: Colors.blue[600]),
            const SizedBox(width: 8),
            const Text('Contact Support'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'If you\'re having trouble with password reset, please contact:',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            _buildContactInfo(
              Icons.email,
              'Email Support',
              'support@schoolmanagement.com',
              () => _openEmail(),
            ),
            const SizedBox(height: 12),
            _buildContactInfo(
              Icons.phone,
              'Phone Support',
              '+1 (555) 123-4567',
              () => _makePhoneCall(),
            ),
            const SizedBox(height: 12),
            _buildContactInfo(
              Icons.location_on,
              'Visit Office',
              'School Administration Office',
              () => _showOfficeHours(),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue[200]!),
              ),
              child: Text(
                'Office Hours: Monday - Friday, 8:00 AM - 5:00 PM',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue[700],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
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

  Widget _buildContactInfo(IconData icon, String title, String info, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue[600], size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    info,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }

  void _openEmail() {
    Get.snackbar(
      'Email Support',
      'Opening email client...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.blue.withOpacity(0.8),
      colorText: Colors.white,
    );
    // In a real app, you would use url_launcher to open email client
  }

  void _makePhoneCall() {
    Get.snackbar(
      'Phone Support',
      'Opening phone dialer...',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
    // In a real app, you would use url_launcher to make phone call
  }

  void _showOfficeHours() {
    Get.dialog(
      AlertDialog(
        title: const Text('Office Hours'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Monday - Friday: 8:00 AM - 5:00 PM'),
            Text('Saturday: 9:00 AM - 1:00 PM'),
            Text('Sunday: Closed'),
            SizedBox(height: 16),
            Text(
              'Location:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('School Administration Office\nRoom 101, Main Building'),
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
}
