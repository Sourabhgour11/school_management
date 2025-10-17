import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management/app/routes/app_routes.dart';

class LoginScreenController extends GetxController {
  // Form key for validation
  final formKey = GlobalKey<FormState>();
  
  // Text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  // Observable variables
  var selectedUserType = 'Student'.obs;
  var isPasswordVisible = true.obs;
  var isLoading = false.obs;
  var rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Set default user type
    selectedUserType.value = 'Student';
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Set user type
  void setUserType(String userType) {
    selectedUserType.value = userType;
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
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

  // Password validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Login function
  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      // Get.toNamed(AppRoutes.studentBottomNavScreen);
      Get.snackbar(
        'Error',
        'Please enter correct credentials',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    }

    if (selectedUserType.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please select a user type',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock login logic - replace with actual API call
      if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
        // Show success message
        Get.snackbar(
          'Success',
          'Login successful! Welcome ${selectedUserType.value}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );

        Get.toNamed(AppRoutes.studentBottomNavScreen);
        
        // Navigate based on user type
        _navigateToDashboard();
      } else {
        throw Exception('Invalid credentials');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error',
      //   'Login failed. Please check your credentials.',
      //   snackPosition: SnackPosition.TOP,
      //   backgroundColor: Colors.red.withOpacity(0.8),
      //   colorText: Colors.white,
      // );
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate to appropriate dashboard based on user type
  void _navigateToDashboard() {
    switch (selectedUserType.value) {
      case 'Student':
         // Get.offAllNamed('/studentBottomNavScreen');
        print('Navigate to Student Dashboard');
        break;
      case 'Teacher':
        // Get.offAllNamed('/teacher-dashboard');
        print('Navigate to Teacher Dashboard');
        break;
      case 'Admin':
        // Get.offAllNamed('/admin-dashboard');
        print('Navigate to Admin Dashboard');
        break;
      case 'Parent':
        // Get.offAllNamed('/parent-dashboard');
        print('Navigate to Parent Dashboard');
        break;
      default:
        print('Unknown user type');
    }
  }


  // Forgot password function
  void forgotPassword() {
    Get.toNamed('/forgotPassword');
  }

  // Go to sign up
  void goToSignUp() {
    Get.toNamed('/signUp');
  }
}
